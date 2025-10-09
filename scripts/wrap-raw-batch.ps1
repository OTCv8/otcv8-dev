<#
  Owiń pliki Markdown w:
    {% raw %}
    ...oryginalna treść...
    {% endraw %}

  Kiedy:
    - plik zawiera wzorce Jinja kolidujące z LUA/tablami: `{{ ... }}` lub `{% ... %}`
    - a NIE jest jeszcze owinięty (brak '{% raw %}')

  Tryby:
    - -Files  <lista plików .md>  -> tylko wskazane
    - -Path   <folder>            -> rekurencyjnie *.md i auto-detekcja
    - -WhatIf                     -> pokaż co by zrobił (bez zapisu)
    - -Verify                     -> zgłoś pliki z problemem (exit 1) / OK (exit 0)

  Uwaga: zapis UTF-8 bez BOM + LF; front matter nie jest modyfikowany.
#>
param(
  [string[]]$Files,
  [string]$Path,
  [switch]$WhatIf,
  [switch]$Verify
)

# wybór celów
$targets = @()
if ($Files -and $Files.Count -gt 0) {
  $targets = $Files
} elseif ($Path) {
  $targets = Get-ChildItem -Path $Path -Recurse -Include *.md -File | ForEach-Object FullName
} else {
  Write-Error "Podaj -Files lub -Path"; exit 1
}

# pomocnicze
$utf8 = New-Object System.Text.UTF8Encoding($false)
$NBSP = [char]0x00A0
$BOM  = [char]0xFEFF

# regexy wykrywające kolizje Jinja
# 1) {{ ... }} w jednej linii (LUA table, itp.)
# 2) {% ... %} (blokowe makra)
$rxCurly  = [regex]'\{\{.*?\}\}'
$rxBlock  = [regex]'\{\%.*?\%\}'

$bad = @()

foreach ($p in $targets) {
  if (-not (Test-Path $p)) { Write-Host "SKIP: $p (brak)"; continue }

  $txt = [IO.File]::ReadAllText($p)
  # normalizacja do oceny
  if ($txt.Length -gt 0 -and $txt[0] -eq $BOM) { $txt = $txt.Substring(1) }
  $eval = $txt.Replace($NBSP,' ')
  $hasRaw   = $eval -match '\{\%\s*raw\s*\%\}'
  $hasEnd   = $eval -match '\{\%\s*endraw\s*\%\}'
  $hasJinja = $rxCurly.IsMatch($eval) -or $rxBlock.IsMatch($eval)

  if ($Verify) {
    if ($hasJinja -and -not $hasRaw) {
      $bad += $p
    }
    continue
  }

  if ($hasJinja -and -not $hasRaw) {
    # owiń cały plik
    $body = [IO.File]::ReadAllText($p)
    $body = $body -replace "`r`n","`n"
    if ($body.Length -gt 0 -and $body[0] -eq $BOM) { $body = $body.Substring(1) }
    $wrapped = "{% raw %}`n" + $body + "`n{% endraw %}`n"

    if ($WhatIf) {
      Write-Host "Would wrap (raw/endraw): $p"
    } else {
      [IO.File]::WriteAllText($p, $wrapped, $utf8)
      Write-Host "Wrapped: $p"
    }
  } else {
    Write-Host "OK: $p"
  }
}

if ($Verify) {
  if ($bad.Count -gt 0) {
    Write-Host "`nPliki wymagające RAW (kolizje Jinja):"
    $bad | ForEach-Object { Write-Host " - $_" }
    exit 1
  } else {
    Write-Host "OK: brak nieowiniętych plików z {{...}} / {%...%}"
    exit 0
  }
}
