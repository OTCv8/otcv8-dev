param(
  [Parameter(Mandatory = $true)][string]$Path,
  [switch]$Apply
)

$ErrorActionPreference = 'Stop'
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

# --- Unicode constants (build from code points; file stays ASCII-only) ---
$CH_EMDASH = [char]0x2014   # —
$CH_ENDASH = [char]0x2013   # –
$CH_REPL = [char]0xFFFD   # �
$CH_L_U = [char]0x0141   # Ł
$CH_L_l = [char]0x0142   # ł

# Polish letters set (for heuristic)
$PolishChars = @(
  0x0105, 0x0107, 0x0119, 0x0142, 0x0144, 0x00F3, 0x015B, 0x017A, 0x017C,
  0x0104, 0x0106, 0x0118, 0x0141, 0x0143, 0x00D3, 0x015A, 0x0179, 0x017B
) | ForEach-Object { [char]$_ }

function Contains-Polish([string]$s) {
  foreach ($c in $PolishChars) { if ($s.IndexOf($c) -ge 0) { return $true } }
  return $false
}

function Try-Transcode1252([string]$s) {
  # Treat current string as if it were decoded as UTF-16 already; re-encode as CP1252 bytes,
  # then decode as UTF-8. This fixes typical mojibake like "Ä…"/"Ĺ"/"â€”".
  try {
    $enc1252 = [Text.Encoding]::GetEncoding(1252)
    $bytes1252 = $enc1252.GetBytes($s)
    $decoded = [Text.Encoding]::UTF8.GetString($bytes1252)
    return $decoded
  }
  catch { return $s }
}

function Fix-HeaderLine([string]$line) {
  if ($line -notmatch '^\s*#{1,6}\s+') { return $line }

  $fixed = $line

  # 1) Attempt to reverse mojibake by CP1252->UTF8 transcode (only if helps)
  $cand = Try-Transcode1252 $fixed
  if (Contains-Polish $cand -and ($cand -ne $fixed)) { $fixed = $cand }

  # 2) Specific friendly fixes in headers
  # "Modul" -> "Moduł"
  $fixed = [Regex]::Replace($fixed, '\bModul\b', ('Modu' + $CH_L_l))

  # If someone wrote "L Modul" instead of "Ł Moduł" at the very start after hashes:
  $fixed = [Regex]::Replace($fixed, '^(?<h>\s*#{1,6}\s+)L(\s+Modu)', ('${h}' + $CH_L_U + '$2'))

  # 3) Replacement char "�" between words -> em dash
  $fixed = $fixed -replace ([regex]::Escape(" " + $CH_REPL + " ")), (" " + $CH_EMDASH + " ")

  # 4) Common double-utf8 for dashes fixed by step 1, but in case any remain:
  $fixed = $fixed -replace 'â€”', [string]$CH_EMDASH
  $fixed = $fixed -replace 'â€“', [string]$CH_ENDASH

  return $fixed
}

function Fix-File([string]$file) {
  $bytes = [IO.File]::ReadAllBytes($file)

  # Strip UTF-8 BOM if present
  $hasBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
  $text = [Text.Encoding]::UTF8.GetString($(if ($hasBom) { $bytes[3..($bytes.Length - 1)] } else { $bytes }))
  $orig = $text

  # Process only headers line-by-line
  $lines = $text -split "(`r`n|`n)"
  for ($i = 0; $i -lt $lines.Count; $i++) {
    $lines[$i] = Fix-HeaderLine $lines[$i]
  }
  $text = ($lines -join "`n")

  # No change and no BOM to drop? Skip write.
  if ($text -ceq $orig -and -not $hasBom) { return $false }

  if ($Apply) {
    $outBytes = $Utf8NoBom.GetBytes($text)
    [IO.File]::WriteAllBytes($file, $outBytes)
  }

  return $true
}

# --- main ---
$files = Get-ChildItem -Path $Path -Recurse -Filter *.md
$changed = 0; $checked = 0

foreach ($f in $files) {
  $checked++
  if (Fix-File $f.FullName) { $changed++ }
}

Write-Host "Checked:  $checked"
Write-Host "Changed:  $changed"
Write-Host "Unchanged:" ($checked - $changed)

if ($Apply) {
  Write-Host "Done. Now: git add -A; git commit -m 'docs: final polish header/title fix'; git push"
}
else {
  Write-Host "Dry-run. Add -Apply to write changes."
}
