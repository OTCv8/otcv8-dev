# scripts/Auto-Migrate-Modules.ps1
[CmdletBinding(SupportsShouldProcess = $true)]
param(
  [string]$Root = ".\docs",
  [switch]$Force
)

Set-StrictMode -Version Latest

# --- Helpers ------------------------------------------------------------

function Remove-Diacritics {
  param([string]$Text)
  if ([string]::IsNullOrWhiteSpace($Text)) { return $Text }

  # 1) Unicode normalization (strip combining marks)
  $formD = $Text.Normalize([Text.NormalizationForm]::FormD)
  $sb = New-Object System.Text.StringBuilder
  foreach ($ch in $formD.ToCharArray()) {
    if ([Globalization.CharUnicodeInfo]::GetUnicodeCategory($ch) -ne [Globalization.UnicodeCategory]::NonSpacingMark) {
      [void]$sb.Append($ch)
    }
  }
  $t = $sb.ToString().Normalize([Text.NormalizationForm]::FormC)

  # 2) Explicit map for letters that don't decompose nicely (ASCII-only keys/values)
  $map = @{}
  # lower
  $map[[char]0x0105] = 'a' # ą
  $map[[char]0x0107] = 'c' # ć
  $map[[char]0x0119] = 'e' # ę
  $map[[char]0x0142] = 'l' # ł
  $map[[char]0x0144] = 'n' # ń
  $map[[char]0x00F3] = 'o' # ó
  $map[[char]0x015B] = 's' # ś
  $map[[char]0x017A] = 'z' # ź
  $map[[char]0x017C] = 'z' # ż
  # upper
  $map[[char]0x0104] = 'A' # Ą
  $map[[char]0x0106] = 'C' # Ć
  $map[[char]0x0118] = 'E' # Ę
  $map[[char]0x0141] = 'L' # Ł
  $map[[char]0x0143] = 'N' # Ń
  $map[[char]0x00D3] = 'O' # Ó
  $map[[char]0x015A] = 'S' # Ś
  $map[[char]0x0179] = 'Z' # Ź
  $map[[char]0x017B] = 'Z' # Ż

  $chars = $t.ToCharArray()
  for ($i=0; $i -lt $chars.Length; $i++) {
    $key = $chars[$i]
    if ($map.ContainsKey($key)) { $chars[$i] = $map[$key] }
  }
  return -join $chars
}

function Convert-ToSlug {
  param([string]$Text)
  $t = Remove-Diacritics $Text
  if ($null -eq $t) { $t = "" }
  $t = $t.ToLowerInvariant()
  $t = $t -replace '[^a-z0-9]+','-'
  $t = $t -replace '^-+','' -replace '-+$',''
  if ([string]::IsNullOrWhiteSpace($t)) { $t = 'modul' }
  return $t
}

function Get-Headings {
  param([string]$Raw)
  $lines = $Raw -split "`r?`n"
  $headings = @()
  $i = 0
  foreach ($line in $lines) {
    $i++
    if ($line -match '^\s{0,3}(#{1,6})\s+(.+?)\s*$') {
      $lvl = $Matches[1].Length
      $txt = $Matches[2].Trim()
      $headings += [pscustomobject]@{ LineNo = $i; Level = $lvl; Text = $txt }
    }
  }
  return ,$headings
}

function Detect-SplitLevel {
  param([object[]]$Headings)
  $h2 = @($Headings | Where-Object { $_.Level -eq 2 })
  $h3 = @($Headings | Where-Object { $_.Level -eq 3 })
  if ($h2.Count -gt 0 -or $h3.Count -gt 0) {
    if ($h3.Count -gt $h2.Count) { return 3 } else { return 2 }
  }
  $h1 = @($Headings | Where-Object { $_.Level -eq 1 })
  if ($h1.Count -gt 1) { return 1 }
  return 0
}

# Stoplista: naglowki, ktore NIE otwieraja nowego modulu (wpadna jako subsekcje)
# ASCII-only: uzywamy \u0142 dla "ł"
$Global:SubsectionStoplistRegex = '^(opis|opis modu(?:l|\u0142)u|funkcje|api|wywo(?:l|\u0142)ania api|eventy|hooki|eventy i hooki|zdarzenia|lua|module|modu(?:l|\u0142))\b'

function Split-LegacyModules {
  param([string]$Raw)

  $lines = $Raw -split "`r?`n"
  $heads = Get-Headings -Raw $Raw
  $splitLevel = Detect-SplitLevel -Headings $heads
  if ($splitLevel -eq 0) { return @() }

  $sections = @()
  $current = $null

  foreach ($line in $lines) {
    if ($line -match '^\s{0,3}(#{1,6})\s+(.+?)\s*$') {
      $lvl = $Matches[1].Length
      $txt = $Matches[2].Trim()

      if ($lvl -eq $splitLevel) {
        # Czy to podsekcja techniczna (Opis/Funkcje/...)? Jesli tak – NIE zaczynaj nowego modulu.
        if ($txt -imatch $Global:SubsectionStoplistRegex) {
          if ($current) {
            $current.Body += "`n`n#### $txt`n"
          } else {
            $current = [ordered]@{ Title = "Misc"; Body = @("`n`n#### $txt`n") }
          }
          continue
        }

        # Nowy modul – zamknij poprzedni, otworz nowy
        if ($current) { $sections += $current }
        $current = [ordered]@{ Title = $txt; Body = @() }
        continue
      }
    }

    if ($current) {
      $current.Body += $line
    }
  }

  if ($current) { $sections += $current }
  foreach ($s in $sections) { $s.Body = ($s.Body -join "`n").Trim() }
  return ,$sections
}

function New-ModuleTemplate {
  param(
    [string]$Title,
    [string]$RelLegacy,
    [string]$ImportedBody
  )
@"
# Moduł: $Title

**Rola:** *(krótko – 1–3 zdania co robi moduł i gdzie jest używany).*

## Zakres
- …

## Punkty wejścia
- **Lua:** …
- **C++/IPC:** …

## UI / OTUI
- Pliki OTUI: …
- Kluczowe widżety: …

## Integracje i zależności
- Współpracuje z: …

## Scenariusze
1. …
2. …

## API (linki)
- [API Lua → klient](../../api/lua/luafunctions_client.md)
- [Engine → Spec UI](../../api/engine/otclient_v_8_specyfikacja_ui.md)

---

> **Uwagi migracyjne**
>
> Ten moduł pochodzi z: $RelLegacy

### Zaimportowana treść (legacy)
$ImportedBody
"@
}

function Ensure-Index {
  param([string]$IndexPath, [Array]$Entries)
  $intro = @"
# Moduły – indeks

Poniżej lista modułów w tej kategorii (auto-generated). Edytuj swobodnie – skrypt będzie dopisywał nowe pozycje.

"@

  $existing = $null
  if (Test-Path $IndexPath) {
    $existing = Get-Content $IndexPath -Raw -Encoding utf8
  } else {
    $existing = $intro
  }

  $marker = "<!-- AUTO-LIST -->"
  $list = ($Entries | Sort-Object Title | ForEach-Object { "- [$($_.Title)]($($_.Rel))" }) -join "`n"

  if ($existing -notmatch [regex]::Escape($marker)) {
    $existing = $existing.TrimEnd() + "`n`n$marker`n`n" + $list + "`n"
  } else {
    $pattern = "(?s)" + [regex]::Escape($marker) + ".*$"
    $replacement = "$marker`n`n$list`n"
    $existing = [regex]::Replace($existing, $pattern, $replacement)
  }

  if ($PSCmdlet.ShouldProcess($IndexPath, "Write index")) {
    Set-Content -Path $IndexPath -Value $existing -Encoding utf8
  }
}

# --- MAIN ---------------------------------------------------------------

$rootFull = Convert-Path $Root
$legacyRel = @(
  "modules\modules_core.md",
  "modules\modules_game_1.md",
  "modules\modules_game_2.md",
  "modules\modules_misc.md"
)
$legacyFiles = @()
foreach ($rel in $legacyRel) {
  $p = Join-Path $rootFull $rel
  if (Test-Path $p) { $legacyFiles += $p }
}

if (-not $legacyFiles) {
  Write-Host "Brak legacy plików do migracji w $rootFull\modules\*.md" -ForegroundColor Yellow
  return
}

$structuredRoot = Join-Path $rootFull "modules\structured"
$categoryMap = @{
  "modules_core.md"   = "core"
  "modules_game_1.md" = "gameplay"
  "modules_game_2.md" = "gameplay"
  "modules_misc.md"   = "dev_tools"
}

$created = @()

# Backup folder
$backupDir = Join-Path (Join-Path $rootFull "modules") ("__md_backup_" + (Get-Date -Format "yyyyMMdd_HHmmss"))
if ($PSCmdlet.ShouldProcess($backupDir, "Ensure backup dir")) {
  New-Item -ItemType Directory -Force -Path $backupDir | Out-Null
}

foreach ($lf in $legacyFiles) {
  $legacyName = Split-Path $lf -Leaf
  $category = $categoryMap[$legacyName]
  if ([string]::IsNullOrWhiteSpace($category)) { $category = "misc" }

  $raw = Get-Content $lf -Raw -Encoding utf8
  $heads = Get-Headings -Raw $raw
  $splitLevel = Detect-SplitLevel -Headings $heads

  if ($splitLevel -eq 0) {
    Write-Host ("Pominięto (brak sensownych nagłówków): {0}" -f $legacyName) -ForegroundColor Yellow
    continue
  }

  Write-Host ("{0}: wykryty poziom podziału H{1} (H2={2}, H3={3}, H1={4})" -f $legacyName,
    $splitLevel,
    (@($heads | Where-Object Level -eq 2)).Count,
    (@($heads | Where-Object Level -eq 3)).Count,
    (@($heads | Where-Object Level -eq 1)).Count
  ) -ForegroundColor DarkGray

  $sections = Split-LegacyModules -Raw $raw
  if (-not $sections -or $sections.Count -eq 0) {
    Write-Host "Pominięto (nie udało się złożyć sekcji): $legacyName" -ForegroundColor Yellow
    continue
  }

  $catDir = Join-Path $structuredRoot $category
  if ($PSCmdlet.ShouldProcess($catDir, "Ensure category dir")) {
    New-Item -ItemType Directory -Force -Path $catDir | Out-Null
  }

  $indexEntries = @()

  foreach ($sec in $sections) {
    $title = $sec.Title
    $slug  = Convert-ToSlug $title
    $dest  = Join-Path $catDir ("modul-" + $slug + ".md")

    $relFromDocs = "modules/structured/$category/modul-$slug.md"
    $relLegacy   = "modules/$legacyName"

    if ((Test-Path $dest) -and -not $Force) {
      Write-Host "EXISTS -> $relFromDocs  (uzyj -Force aby nadpisac)" -ForegroundColor Cyan
    } else {
      $imported = $sec.Body
      if (-not [string]::IsNullOrWhiteSpace($imported)) {
        # ustaw max na H4, by nie mieszac z definicja modulu
        $imported = $imported -replace '(?m)^(#{1,6})\s*', '#### '
      }
      $content = New-ModuleTemplate -Title $title -RelLegacy $relLegacy -ImportedBody $imported
      if ($PSCmdlet.ShouldProcess($dest, "Write module")) {
        Set-Content -Path $dest -Value $content -Encoding utf8
      }
      $created += $relFromDocs
      Write-Host "CREATED -> $relFromDocs" -ForegroundColor Green
    }

    $indexEntries += [pscustomobject]@{ Title = $title; Rel = "./modul-$slug.md" }
  }

  # Zaktualizuj indeks kategorii
  $indexPath = Join-Path $catDir "INDEX.md"
  Ensure-Index -IndexPath $indexPath -Entries $indexEntries

  # Zastap legacy notka i zrob backup
  $note = @"
!!! note "Przeniesione"
    Ten dokument został przeniesiony do katalogu **structured**.
    Zobacz spis: [modules/structured/$category/INDEX.md](../modules/structured/$category/INDEX.md)
"@
  if ($PSCmdlet.ShouldProcess($lf, "Backup & replace legacy with note")) {
    Copy-Item -Path $lf -Destination (Join-Path $backupDir $legacyName) -Force
    Set-Content -Path $lf -Value $note -Encoding utf8
    Write-Host "LEGACY -> zastepiono notka: modules/$legacyName (backup w modules/$([IO.Path]::GetFileName($backupDir)))" -ForegroundColor DarkYellow
  }
}

Write-Host ""
Write-Host "DONE. Nowe pliki (przyklady):" -ForegroundColor White
$created | Select-Object -First 10 | ForEach-Object { Write-Host " - $_" }
if ($created.Count -gt 10) { Write-Host " ... ($($created.Count) lacznie)" }
Write-Host ""
Write-Host "Najpierw uruchom z -WhatIf. Gdy OK -> bez -WhatIf (ew. z -Force)." -ForegroundColor Gray
