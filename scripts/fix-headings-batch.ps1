param(
  [string]$Path = ".\docs",
  [string[]]$Files,
  [switch]$WhatIf,
  [switch]$Verify
)

function Get-TargetFiles {
  if ($Files -and $Files.Count -gt 0) { return $Files }
  return Get-ChildItem -Path $Path -Recurse -Include *.md | Select-Object -ExpandProperty FullName
}

# Wzorce do weryfikacji problemów z nagłówkami
$rxLeadingHashInside = '^(#{1,6}\s+)#\s+'     # np. "## # Tytuł"
$rxMissingSpace      = '^(#{1,6})(\S)'        # np. "##Tytuł"

function Verify-File([string]$f) {
  $bad1 = Select-String -Path $f -Pattern $rxLeadingHashInside -Encoding utf8
  $bad2 = Select-String -Path $f -Pattern $rxMissingSpace      -Encoding utf8
  if ($bad1 -or $bad2) {
    Write-Host $f -ForegroundColor Yellow
    foreach($m in $bad1){ "  L{0}: {1}" -f $m.LineNumber, $m.Line }
    foreach($m in $bad2){ "  L{0}: {1}" -f $m.LineNumber, $m.Line }
    return $true
  }
  return $false
}

function Fix-File([string]$f) {
  $text = Get-Content -Path $f -Raw -Encoding UTF8
  $lines = $text -split "`n", 0, 'SimpleMatch'
  $inCode = $false
  $changed = $false

  for ($i=0; $i -lt $lines.Count; $i++) {
    $line = $lines[$i]

    # wykrywanie bloków kodu (``` lub ```lang)
    if ($line -match '^\s*```') {
      $inCode = -not $inCode
      continue
    }
    if ($inCode) { continue } # nie dotykamy kodu

    # 1) "## # Tytuł" -> "## Tytuł"
    $new = $line -replace $rxLeadingHashInside, '$1'

    # 2) "##Tytuł" -> "## Tytuł"
    $new = $new -replace $rxMissingSpace, '$1 $2'

    if ($new -ne $line) {
      $lines[$i] = $new
      $changed = $true
    }
  }

  if ($changed) {
    if ($WhatIf) {
      Write-Host "Would fix: $f"
    } else {
      # zapis w UTF-8 bez BOM + LF
      $out = ($lines -join "`n")
      $bytes = [System.Text.Encoding]::UTF8.GetBytes($out)
      [System.IO.File]::WriteAllBytes($f, $bytes)
      Write-Host "Fixed: $f"
    }
  }
}

$targets = Get-TargetFiles

if ($Verify) {
  $any = $false
  foreach ($f in $targets) {
    if (Verify-File $f) { $any = $true }
  }
  if (-not $any) { Write-Host "OK: brak problematycznych nagłówków." -ForegroundColor Green }
  exit 0
}

foreach ($f in $targets) {
  # szybka wstępna selekcja — jeśli nie ma '#' na początku linii, pomiń
  $hasHeadingProblems = Select-String -Path $f -Encoding utf8 -Pattern $rxLeadingHashInside,$rxMissingSpace -Quiet
  if ($hasHeadingProblems) { Fix-File $f }
}
