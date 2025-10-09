# scripts/Generate-MkdocsYml.ps1
[CmdletBinding()]
param(
  [string]$DocsRoot = ".\docs",
  [string]$Mkdocs = ".\mkdocs.yml",
  [switch]$DryRun
)

Set-StrictMode -Version Latest

function New-NavEntry {
  param([string]$Title, [string]$RelPath)
  # Dwupoziomowe wcięcie pod kategoriami; używamy ${} gdy po nazwie jest ':'
  "      - ${Title}: ${RelPath}"
}

function Get-FileTitle {
  param([string]$Content, [string]$FallbackName)

  # 1) Spróbuj H1 w formacie: "# Moduł: XYZ" albo "# Modul: XYZ" (ł -> \u0142)
  $m = [regex]::Match($Content, '(?ms)^\s*#\s*Modu(?:\u0142|l)\s*:\s*(.+?)\s*$')
  if ($m.Success) {
    return $m.Groups[1].Value.Trim()
  }

  # 2) Jak nie ma powyższego — zwykłe pierwsze H1 "# Tytuł"
  $m2 = [regex]::Match($Content, '(?m)^\s*#\s+(.+?)\s*$')
  if ($m2.Success) {
    return $m2.Groups[1].Value.Trim()
  }

  # 3) Fallback — nazwa pliku bez rozszerzenia
  return $FallbackName
}

function Build-StructuredNav {
  param([string]$DocsRoot)
  $root = Convert-Path $DocsRoot

  $catPaths = @(
    (Join-Path $root "modules\structured\core"),
    (Join-Path $root "modules\structured\gameplay"),
    (Join-Path $root "modules\structured\dev_tools")
  )

  $existingCats = foreach ($p in $catPaths) { if (Test-Path $p) { $p } }

  $yaml = @()
  $yaml += "  - Moduły:"

  foreach ($cat in $existingCats) {
    $catName = Split-Path $cat -Leaf
    switch ($catName) {
      "core" { $catTitle = "Core" }
      "gameplay" { $catTitle = "Gameplay" }
      "dev_tools" { $catTitle = "Dev tools" }
      default { $catTitle = $catName }
    }

    $yaml += "    - ${catTitle}:"

    $index = Join-Path $cat "INDEX.md"
    if (Test-Path $index) {
      $rel = ("modules/structured/{0}/INDEX.md" -f $catName).Replace('\', '/')
      $yaml += (New-NavEntry -Title "INDEX" -RelPath $rel)
    }

    Get-ChildItem $cat -Filter "modul-*.md" -File | Sort-Object Name | ForEach-Object {
      $content = Get-Content $_.FullName -Raw -Encoding utf8
      $fallback = [IO.Path]::GetFileNameWithoutExtension($_.Name)
      $title = Get-FileTitle -Content $content -FallbackName $fallback
      $rel = ("modules/structured/{0}/{1}" -f $catName, $_.Name).Replace('\', '/')
      $yaml += (New-NavEntry -Title $title -RelPath $rel)
    }
  }

  return $yaml -join "`n"
}

function Build-ArchNav {
  param([string]$DocsRoot)
  $root = Convert-Path $DocsRoot

  $items = @(
    @{ t = "Przegląd wysokopoziomowy"; p = "guides/architecture.md" },
    @{ t = "Przegląd klienta (C++)"; p = "architektura/client_overview.md" },
    @{ t = "Framework (C++)"; p = "architektura/framework_overview.md" },
    @{ t = "Struktura źródeł (client)"; p = "architektura/src_client.md" },
    @{ t = "Struktura źródeł (framework)"; p = "architektura/src_framework.md" }
  )

  $yaml = @()
  $yaml += "  - Architektura:"
  foreach ($i in $items) {
    $full = Join-Path $root $i.p
    if (Test-Path $full) {
      $yaml += (New-NavEntry -Title $i.t -RelPath ($i.p.Replace('\', '/')))
    }
  }
  return $yaml -join "`n"
}

function Build-ApiNav {
  param([string]$DocsRoot)
  $root = Convert-Path $DocsRoot
  $yaml = @()
  $yaml += "  - API:"

  # Engine
  $yaml += "    - Engine:"
  $engine = @(
    @{ t = "Specyfikacja UI"; p = "api/engine/otclient_v_8_specyfikacja_ui.md" },
    @{ t = "Walidator"; p = "api/engine/otclient_v_8_walidator_macierze_ast_i_round_trip_specyfikacja_techniczna.md" }
  )
  foreach ($e in $engine) {
    $full = Join-Path $root $e.p
    if (Test-Path $full) { $yaml += (New-NavEntry -Title $e.t -RelPath ($e.p.Replace('\', '/'))) }
  }

  # Lua
  $yaml += "    - Lua:"
  $lua = @(
    @{ t = "Style guide"; p = "lua/style-guide.md" },
    @{ t = "Referencja klienta"; p = "api/lua/luafunctions_client.md" }
  )
  foreach ($l in $lua) {
    $full = Join-Path $root $l.p
    if (Test-Path $full) { $yaml += (New-NavEntry -Title $l.t -RelPath ($l.p.Replace('\', '/'))) }
  }

  # Zbiorcze
  $all = "api/otcv8-full-api.md"
  if (Test-Path (Join-Path $root $all)) {
    $yaml += (New-NavEntry -Title "Zbiorcze" -RelPath ($all.Replace('\', '/')))
  }

  return $yaml -join "`n"
}

function Build-RedirectsMap {
  @'
redirect_maps:
  "guides/architecture.md": "architektura/client_overview.md"
  "modules/modules_core.md": "modules/structured/core/INDEX.md"
  "modules/modules_game_1.md": "modules/structured/gameplay/INDEX.md"
  "modules/modules_game_2.md": "modules/structured/gameplay/INDEX.md"
  "modules/modules_misc.md": "modules/structured/dev_tools/INDEX.md"
'@
}

# ---------------- MAIN ----------------

$mkExists = Test-Path $Mkdocs
if ($mkExists) {
  $mkOld = Get-Content $Mkdocs -Raw -Encoding utf8
}
else {
  $mkOld = ""
}

# NAV
$nav = @()
$nav += "nav:"

$start = Join-Path $DocsRoot "index.md"
if (Test-Path $start) { $nav += "  - Start: index.md" }

$nav += (Build-ArchNav -DocsRoot $DocsRoot)
$nav += (Build-ApiNav  -DocsRoot $DocsRoot)
$nav += (Build-StructuredNav -DocsRoot $DocsRoot)
$navYaml = $nav -join "`n"

# Plugins + Redirects
$pluginsBlock = @"
plugins:
  - search
  - redirects
"@.Trim()

$redirects = Build-RedirectsMap

# Złóż nowy mkdocs.yml
$newFile = $null
if ($mkExists -and ($mkOld -match "(?ms)^\s*nav\s*:\s*.*?(?=^\S|\z)")) {
  $replacement = $navYaml + "`n`n" + $pluginsBlock + "`n`n" + $redirects
  $newFile = [regex]::Replace($mkOld, "(?ms)^\s*nav\s*:\s*.*?(?=^\S|\z)", [System.Text.RegularExpressions.MatchEvaluator] { param($m) $replacement })
}
else {
  $newFile = @"
site_name: OTCv8 Docs
theme:
  name: material

$navYaml

$pluginsBlock

$redirects
"@.Trim()
}

if ($DryRun) {
  "`n========== mkdocs.yml (preview) =========="
  $newFile
  "`n=========================================`n"
  return
}

if ($mkExists) {
  Copy-Item $Mkdocs "$Mkdocs.bak" -Force
}
$newFile | Set-Content $Mkdocs -Encoding utf8
Write-Host "mkdocs.yml updated. Backup: $Mkdocs.bak" -ForegroundColor Green
