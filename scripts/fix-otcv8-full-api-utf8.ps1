<#
  Wymusza UTF-8 (bez BOM) + LF dla: docs/api/otcv8-full-api.md
  Tryby:
    - domyślnie: naprawia i zapisuje
    - -WhatIf   : pokazuje co by zrobił (bez zapisu)
    - -Verify   : tylko sprawdza (exit 0 OK / 1 błąd)
#>
param(
  [string]$File = "docs/api/otcv8-full-api.md",
  [switch]$WhatIf,
  [switch]$Verify
)

if (-not (Test-Path $File)) { Write-Error "Brak pliku: $File"; exit 1 }

# Czytaj surowo bajty i jako tekst UTF-8
$bytes = [IO.File]::ReadAllBytes($File)
$text  = [Text.Encoding]::UTF8.GetString($bytes)

# detekcja
$hasCRLF  = $text -match "`r`n"
$hasBOMhd = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
$hasBOMch = ($text.Length -gt 0 -and $text[0] -eq [char]0xFEFF) # BOM jako znak w treści
$mojibake = $text -match "[ÂÃâ]"

if ($Verify) {
  if (-not $hasCRLF -and -not $hasBOMhd -and -not $hasBOMch -and -not $mojibake) {
    Write-Host "OK: UTF-8 bez BOM + LF, brak mojibake -> $File"
    exit 0
  } else {
    Write-Host "FAIL: $File"
    if ($hasCRLF)  { Write-Host " - CRLF wykryte (powinno być LF)" }
    if ($hasBOMhd) { Write-Host " - BOM w nagłówku pliku" }
    if ($hasBOMch) { Write-Host " - Znak U+FEFF (BOM) w treści" }
    if ($mojibake) { Write-Host " - Artefakty (Â/Ã/â)" }
    exit 1
  }
}

# Naprawa: usuń BOM jako znak, normalizuj EOL, zapisz bez BOM w nagłówku
if ($hasBOMch) { $text = $text.Substring(1) }
$text = $text -replace "`r`n", "`n"

$utf8NoBom = New-Object Text.UTF8Encoding($false)

if ($WhatIf) {
  Write-Host "Would fix: $File"
  if ($hasCRLF)  { Write-Host " - Zmieniam EOL: CRLF -> LF" }
  if ($hasBOMhd) { Write-Host " - Usuwam BOM w nagłówku" }
  if ($hasBOMch) { Write-Host " - Usuwam znak U+FEFF z treści (początek pliku)" }
  if ($mojibake) { Write-Host " - Uwaga: wykryto Â/Ã/â (ten skrypt nie transliteruje znaków)" }
  exit 0
} else {
  [IO.File]::WriteAllText($File, $text, $utf8NoBom)
  Write-Host "Fixed: UTF-8 bez BOM (nagłówek) + LF, oraz usunięty U+FEFF z treści -> $File"
  exit 0
}
