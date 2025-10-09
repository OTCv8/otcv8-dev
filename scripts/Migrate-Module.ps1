<#
.SYNOPSIS
  Migruje moduł: legacy -> structured, generuje szablon, dodaje redirect do mkdocs.yml.

.USAGE (pojedynczy moduł)
  pwsh scripts/Migrate-Module.ps1 `
    -Legacy 'docs/modules/modules_game_1.md' `
    -NewRel 'modules/structured/gameplay/modul-game_interface.md' `
    -ModuleName 'game_interface' `
    -Role 'UI głównego interfejsu gry: layout, panele, podstawowe widżety.' `
    -Force

.USAGE (batch z CSV)
  # CSV: Legacy,NewRel,ModuleName,Role
  pwsh scripts/Migrate-Module.ps1 -Csv 'scripts/migrate.csv'

.NOTES
  - Szablon jest wbudowany.
  - Działa z -WhatIf (próba na sucho) i -Force (nadpisywanie istniejących structured).
#>

[CmdletBinding(SupportsShouldProcess=$true)]
param(
  [Parameter(ParameterSetName='Single', Mandatory=$true)]
  [string]$Legacy,
  [Parameter(ParameterSetName='Single', Mandatory=$true)]
  [string]$NewRel,
  [Parameter(ParameterSetName='Single', Mandatory=$true)]
  [string]$ModuleName,
  [Parameter(ParameterSetName='Single', Mandatory=$false)]
  [string]$Role = "Krótki opis modułu (1–3 zdania).",

  [Parameter(ParameterSetName='Batch', Mandatory=$true)]
  [string]$Csv,

  [switch]$Force,
  [string]$MkDocsPath = "mkdocs.yml"
)

function New-Structured-Content {
param(
  [string]$ModuleName,
  [string]$Role
)
@"
# Moduł: `$ModuleName  {: #mod-$ModuleName }

**Rola:** $Role

## Zakres
- (wypisz najważniejsze funkcje modułu)

## Punkty wejścia
- **Lua:** \`modules/.../file.lua\` → \`function foo()\`
- **C++/IPC:** (opcjonalnie)

## UI / OTUI
- Pliki OTUI: \`modules/.../ui/*.otui\`
- Kluczowe widżety: …

## Integracje i zależności
- Współpracuje z: \`[game_inventory](../gameplay/modul-game_inventory.md)\`, \`[corelib/ui](../dev_tools/modul-corelib-ui.md)\` …

## Scenariusze
1. …
2. …

## API (linki)
- [API Lua → Player Functions](../../api/lua/luafunctions_client.md#player)
- [Engine Spec → Walidator](../../api/engine/otclient_v_8_walidator_macierze_ast_i_round_trip_specyfikacja_techniczna.md)
"@
}

function Set-Legacy-MovedNote {
param([string]$LegacyPath,[string]$NewRelPath)
$note = @"
!!! note "Przeniesione"
    Ten moduł został przeniesiony do: [$NewRelPath](../../$NewRelPath)
"@
  Set-Content -Path $LegacyPath -Value $note -Encoding utf8
}

function Add-Redirect-Map {
param([string]$MkDocs,[string]$LegacyRel,[string]$NewRel)
  if(-not (Test-Path $MkDocs)){ throw "mkdocs.yml nie znaleziony: $MkDocs" }
  $orig = Get-Content $MkDocs -Raw -Encoding utf8
  $backup = "$MkDocs.bak_$(Get-Date -Format yyyyMMddHHmmss)"
  $orig | Set-Content $backup -Encoding utf8

  if($orig -notmatch '(?m)^\s*plugins:\s*[\r\n]+'){
    $orig += "`nplugins:`n  - search`n  - redirects`n"
  } elseif($orig -notmatch '(?m)^\s*-\s*redirects\s*$'){
    $orig = $orig -replace '(?m)^(plugins:\s*[\r\n]+(?:\s*-\s*\S+\s*[\r\n]+)*)','$1  - redirects' + "`n"
  }

  if($orig -match '(?m)^redirect_maps:\s*$'){
    $orig = $orig -replace '(?m)^(redirect_maps:\s*[\r\n]+)',"`$1  `"$LegacyRel`": `"$NewRel`"`n"
  } elseif($orig -match '(?m)^plugins:'){
    $orig += "`nredirect_maps:`n  `"$LegacyRel`": `"$NewRel`"`n"
  } else {
    $orig += "`nplugins:`n  - redirects`nredirect_maps:`n  `"$LegacyRel`": `"$NewRel`"`n"
  }

  Set-Content -Path $MkDocs -Value $orig -Encoding utf8
  Write-Host "redirect_maps: `"$LegacyRel`" -> `"$NewRel`" dodany (kopię zapisano w $backup)"
}

function Invoke-One-Migration {
param(
  [string]$LegacyAbs,
  [string]$LegacyRel,
  [string]$NewRel,
  [string]$ModuleName,
  [string]$Role,
  [switch]$Force
)
  $newAbs = Join-Path -Path (Resolve-Path '.').Path -ChildPath "docs/$NewRel"
  $newDir = Split-Path $newAbs -Parent
  if(-not (Test-Path $LegacyAbs)){ throw "Brak pliku legacy: $LegacyAbs" }

  if(Test-Path $newAbs -and -not $Force){
    throw "Plik docelowy już istnieje: $newAbs (użyj -Force aby nadpisać)"
  }

  if($PSCmdlet.ShouldProcess("$newAbs","Create structured doc")){
    New-Item -ItemType Directory -Force -Path $newDir | Out-Null
    New-Structured-Content -ModuleName $ModuleName -Role $Role |
      Set-Content -Path $newAbs -Encoding utf8
    Write-Host "Utworzono: $newAbs"
  }

  if($PSCmdlet.ShouldProcess("$LegacyAbs","Replace with moved-note")){
    Set-Legacy-MovedNote -LegacyPath $LegacyAbs -NewRelPath $NewRel
    Write-Host "Legacy zastąpiony notką: $LegacyAbs"
  }

  if($PSCmdlet.ShouldProcess("$MkDocsPath","Append redirect_maps")){
    Add-Redirect-Map -MkDocs $MkDocsPath -LegacyRel ($LegacyRel -replace '^docs/','') -NewRel $NewRel
  }
}

# --- MAIN ---
if($PSCmdlet.ParameterSetName -eq 'Batch'){
  if(-not (Test-Path $Csv)){ throw "CSV nie istnieje: $Csv" }
  $rows = Import-Csv $Csv
  foreach($r in $rows){
    $legacyRel = $r.Legacy
    $legacyAbs = Join-Path (Resolve-Path '.').Path $legacyRel
    Invoke-One-Migration `
      -LegacyAbs $legacyAbs `
      -LegacyRel $legacyRel `
      -NewRel $r.NewRel `
      -ModuleName $r.ModuleName `
      -Role ($r.Role ?? "Krótki opis modułu (1–3 zdania).") `
      -Force:$Force
  }
} else {
  $legacyAbs = Join-Path (Resolve-Path '.').Path $Legacy
  Invoke-One-Migration `
    -LegacyAbs $legacyAbs `
    -LegacyRel $Legacy `
    -NewRel $NewRel `
    -ModuleName $ModuleName `
    -Role $Role `
    -Force:$Force
}

Write-Host "Gotowe."
