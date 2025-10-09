param(
  [string]$Path = ".\docs",
  [switch]$WhatIf,
  [switch]$Verify
)

$utf8 = New-Object System.Text.UTF8Encoding($false)

# Wzorzec: linie nagłówków Markdown zaczynające się od #... i znaku ¦ po spacji
$rxFind = '^\s*#+\s*\u00A6'                 # trafi np. "# ¦ Modul: ..."
$rxReplace = '(^\s*#+\s*)\u00A6\s*'         # przechwyć "# + spacje" i zamień ¦ -> |
$repl = '$1| '                              # wynik: "# | Modul: ..."

function Show-Hits($root){
  Select-String -Path (Join-Path $root "**\*.md") -Pattern $rxFind -Encoding UTF8 |
    ForEach-Object { "{0}:{1}  {2}" -f $_.Path, $_.LineNumber, $_.Line.Trim() }
}

if ($WhatIf) {
  Write-Host "SCAN (nagłówki z '¦'):"
  Show-Hits $Path
  return
}

if ($Verify) {
  $hits = Select-String -Path (Join-Path $Path "**\*.md") -Pattern $rxFind -Encoding UTF8
  if ($hits) {
    Write-Host "FAIL: wykryto nagłówki z '¦':"
    $hits | ForEach-Object { "{0}:{1}  {2}" -f $_.Path, $_.LineNumber, $_.Line.Trim() } | Write-Host
    exit 1
  } else {
    Write-Host "OK: brak nagłówków z '¦'."
    exit 0
  }
}

$changed = 0
Get-ChildItem -Path $Path -Recurse -Include *.md -File | ForEach-Object {
  $t = Get-Content $_.FullName -Raw -Encoding UTF8
  $fixed = [regex]::Replace($t, $rxReplace, $repl, 'Multiline')
  if ($fixed -ne $t) {
    [System.IO.File]::WriteAllText($_.FullName, $fixed, $utf8)
    Write-Host "Fix: $($_.FullName)"
    $changed++
  }
}
Write-Host "Changed: $changed"
