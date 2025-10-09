param(
  [string]$BaseRef = "origin/main"   # Podstawa do porównania zmian (np. main/develop)
)

$ErrorActionPreference = "Stop"
$docsRoot = Join-Path $PSScriptRoot "..\docs"
if (-not (Test-Path $docsRoot)) { throw "Nie znaleziono katalogu docs: $docsRoot" }

function Get-AllMd {
  Get-ChildItem $docsRoot -Recurse -Filter *.md
}

function Get-ChangedMd {
  $changed = git diff --name-only --diff-filter=ACMRT $BaseRef -- "docs/**/*.md" 2>$null
  if (-not $changed) { return @() }
  $changed | Where-Object { Test-Path $_ } | ForEach-Object { Get-Item $_ }
}

$allMd = Get-AllMd
$changedMd = Get-ChangedMd

Write-Host "📚 Plików .md (all):" $allMd.Count
Write-Host "🆕 Plików .md zmienionych vs ${BaseRef}:" $changedMd.Count

$problems = @()

# 1) Walidacja nagłówków (jak w Twoich skryptach)
$headerPattern = '^(#{1,9})(\S)|^(#{1,9})\s+#\s+|^(#{7,})\s+|^(#{1,6})\s+.*\s+#\s*$'
$allMd | ForEach-Object {
  $path = $_.FullName
  $matches = Select-String -Path $path -Encoding utf8 -Pattern $headerPattern
  if ($matches) {
    $problems += [pscustomobject]@{ Type="Headers"; File=$path; Detail=("Błędny format nagłówków: {0}" -f ($matches.Count)) }
  }
}

# 2) Kotwice: duplikaty w obrębie tego samego pliku (mogą psuć linki #anchor)
function Slugify($text) {
  # proste slugowanie jak GitHub: lower, usuwamy znaki nie-alfanum./spacje -> '-', kompresujemy wielokrotne '-'
  $s = ($text -replace '[^\p{L}\p{Nd}\s-]', '') # usuń znaki specjalne
  $s = $s.ToLower() -replace '\s+', '-' -replace '-+', '-'
  return $s.Trim('-')
}
$allMd | ForEach-Object {
  $path = $_.FullName
  $inFence = $false
  $slugs = @{}
  $ln = 0
  Get-Content $path -Encoding utf8 | ForEach-Object {
    $ln++
    $line = $_
    if ($line -match '^\s*```') { $inFence = -not $inFence; return }
    if ($inFence) { return }
    if ($line -match '^\s*(#{1,6})\s+(.+)$') {
      $slug = Slugify($matches[2])
      if ([string]::IsNullOrWhiteSpace($slug)) { return }
      if ($slugs.ContainsKey($slug)) {
        $slugs[$slug] += 1
      } else {
        $slugs[$slug] = 1
      }
    }
  }
  $dups = $slugs.GetEnumerator() | Where-Object { $_.Value -gt 1 }
  foreach ($d in $dups) {
    $problems += [pscustomobject]@{ Type="AnchorDuplicate"; File=$path; Detail=("Zduplikowana kotwica: {0} (x{1})" -f $d.Key, $d.Value) }
  }
}

# 3) Sprawdzenie wewnętrznych linków i obrazków (czy pliki/sekcje istnieją)
#    Szukamy [tekst](ścieżka) i ![alt](ścieżka), pomijamy http/https/mailto
$linkRegex = '\[(?:[^\]]*)\]\((?<href>[^)]+)\)'
$allMd | ForEach-Object {
  $path = $_.FullName
  $dir = Split-Path $path
  $content = Get-Content $path -Raw -Encoding utf8

  foreach ($m in [regex]::Matches($content, $linkRegex)) {
    $href = $m.Groups['href'].Value.Trim()
    if ($href -match '^(https?:|mailto:|tel:|#)') { continue } # zewnętrzne/anker lokalny
    # rozbij na plik i #anchor
    $parts = $href -split '#', 2
    $rel = $parts[0]
    $anchor = $null
    if ($parts.Count -eq 2) { $anchor = $parts[1] }

    # znormalizuj ścieżkę
    $target = if ([string]::IsNullOrWhiteSpace($rel)) { $path } else { Join-Path $dir $rel }
    $target = [System.IO.Path]::GetFullPath($target)

    if (-not (Test-Path $target)) {
      $problems += [pscustomobject]@{ Type="LinkMissing"; File=$path; Detail=("Brak pliku docelowego: {0}" -f $href) }
      continue
    }

    if ($anchor) {
      if ((Get-Item $target).Extension -ne ".md") { continue } # kotwice tylko w md
      $anchors = @()
      $inFence = $false
      Get-Content $target -Encoding utf8 | ForEach-Object {
        if ($_ -match '^\s*```') { $inFence = -not $inFence; return }
        if ($inFence) { return }
        if ($_ -match '^\s*(#{1,6})\s+(.+)$') {
          $anchors += (Slugify($matches[2]))
        }
      }
      if (-not ($anchors -contains (Slugify($anchor)))) {
        $problems += [pscustomobject]@{ Type="AnchorMissing"; File=$path; Detail=("Brak kotwicy #{0} w {1}" -f $anchor, (Resolve-Path $target)) }
      }
    }
  }
}

# 4) Trailing whitespace i taby w nagłówkach
$allMd | ForEach-Object {
  $path = $_.FullName
  $issues = @()
  $lines = Get-Content $path -Encoding utf8
  for ($i=0; $i -lt $lines.Count; $i++) {
    $l = $lines[$i]
    if ($l -match '\s+$') { $issues += "L$($i+1): trailing whitespace" }
    if ($l -match '^(#{1,6})\t') { $issues += "L$($i+1): tab w nagłówku" }
  }
  if ($issues.Count -gt 0) {
    $problems += [pscustomobject]@{ Type="Whitespace"; File=$path; Detail=($issues -join '; ') }
  }
}

# 5) Szybki sanity: UTF-8 bez BOM
$allMd | ForEach-Object {
  $bytes = [System.IO.File]::ReadAllBytes($_.FullName)
  $hasBom = ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF)
  if ($hasBom) {
    $problems += [pscustomobject]@{ Type="BOM"; File=$_.FullName; Detail="Plik ma BOM (zalecane bez BOM)" }
  }
}

# 6) Raport
if ($problems.Count -eq 0) {
  Write-Host "`n✅ Wszystko wygląda dobrze. Brak problemów." -ForegroundColor Green
  exit 0
} else {
  Write-Host "`n❌ Wykryto problemy:" -ForegroundColor Red
  $problems | Sort-Object Type, File | Format-Table -AutoSize
  Write-Host "`nPodsumowanie:"
  $problems | Group-Object Type | Select-Object Count, Name | Format-Table -AutoSize
  exit 1
}
