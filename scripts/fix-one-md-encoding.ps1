<#
  V2: Dekoduje BEZPOŚREDNIO Z BAJTÓW i testuje: UTF-8, CP1250, ISO-8859-2, Latin1.
  Wybiera: min mojibake (Â/Ã/â), przy remisie max liczba polskich znaków.
  Zapis: UTF-8 bez BOM + LF.  Tryby: -WhatIf / -Verify.
#>
param(
  [string]$File = "docs/build/android.md",
  [switch]$WhatIf,
  [switch]$Verify
)

if (-not (Test-Path $File)) { Write-Error "Brak pliku: $File"; exit 1 }

$encUtf8NoBom = New-Object System.Text.UTF8Encoding($false)
$utf8 = [System.Text.Encoding]::UTF8
$cp1250 = [System.Text.Encoding]::GetEncoding(1250)
$iso88592 = [System.Text.Encoding]::GetEncoding(28592)
$latin1 = [System.Text.Encoding]::GetEncoding(28591)
$NBSP = [char]0x00A0
$BOM = [char]0xFEFF

function Count-Mojibake([string]$s) { ([regex]::Matches($s, '[\u00C2\u00C3\u00E2]')).Count }
function Count-Polish([string]$s) { ([regex]::Matches($s, '[\u0105\u0107\u0119\u0142\u0144\u00F3\u015B\u017A\u017C\u0104\u0106\u0118\u0141\u0143\u00D3\u015A\u0179\u017B]')).Count }
function Normalize([string]$s) {
  if ($s.Length -gt 0 -and $s[0] -eq $BOM) { $s = $s.Substring(1) }
  $s = $s.Replace($NBSP, ' ')
  $s = $s -replace "`r`n", "`n"
  return $s
}

# --- kandydaci: DEKODUJEMY BAJTY RÓŻNYMI KODOWANIAMI ---
$bytes = [System.IO.File]::ReadAllBytes($File)
$candidates = @(
  @{ name = 'utf8'    ; txt = $utf8.GetString($bytes) },
  @{ name = 'cp1250'  ; txt = $cp1250.GetString($bytes) },
  @{ name = 'iso88592'; txt = $iso88592.GetString($bytes) },
  @{ name = 'latin1'  ; txt = $latin1.GetString($bytes) }
)

$scored = foreach ($c in $candidates) {
  $t = Normalize $c.txt
  $tEval = $t
  [pscustomobject]@{
    Name     = $c.name
    Text     = $t
    Mojibake = Count-Mojibake $tEval
    Polish   = Count-Polish  $tEval
  }
}

$best = $scored | Sort-Object Mojibake, @{Expression = 'Polish'; Descending = $true } | Select-Object -First 1
$fixed = $best.Text

if ($Verify) {
  $t = ($scored | Where-Object Name -eq 'utf8').Text
  $ok = (Count-Mojibake $t) -eq 0 -and ($t -notmatch "`r`n") -and ($t.Length -eq 0 -or $t[0] -ne $BOM)
  if ($ok) { Write-Host "OK: $File (UTF-8 bez BOM + LF, brak artefaktów)"; exit 0 }
  else { Write-Host "FAIL: $File"; exit 1 }
}

Write-Host ("Best candidate: {0} (Mojibake={1}, Polish={2})" -f $best.Name, $best.Mojibake, $best.Polish)
if ($WhatIf) { Write-Host ("Would write UTF-8 (no BOM) + LF -> {0}" -f $File); exit 0 }

[System.IO.File]::WriteAllText($File, $fixed, $encUtf8NoBom)
Write-Host ("Fixed -> {0} (UTF-8 bez BOM + LF; variant={1})" -f $File, $best.Name)
exit 0
