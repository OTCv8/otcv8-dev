param(
  [string]$Root,   # repo root (folder zawierajacy "docs")
  [string]$Docs,   # bezposrednia sciezka do "docs"
  [switch]$WhatIf  # podglad zmian
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
# UTF-8 without BOM encoder
$Utf8NoBom = New-Object System.Text.UTF8Encoding($false)

function Resolve-DocsPath {
  param([string]$Root,[string]$Docs)

  if ($Docs) {
    return (Resolve-Path -LiteralPath $Docs -ErrorAction Stop).ProviderPath
}

  if ($Root) {
    $base = (Resolve-Path -LiteralPath $Root -ErrorAction Stop).ProviderPath
    $p = Join-Path $base 'docs'
    if (Test-Path $p) { return (Resolve-Path $p).ProviderPath }
    throw "Docs folder not found under: $base"
}
# try: script location -> repo root (one level up) -> cwd
  $scriptDir = Split-Path -Parent $PSCommandPath
  if ($scriptDir) {
    $repoFromScript = Split-Path -Parent $scriptDir
    $p = Join-Path $repoFromScript 'docs'
    if (Test-Path $p) { return (Resolve-Path $p).ProviderPath }
}

  $p = Join-Path (Get-Location).Path 'docs'
  if (Test-Path $p) { return (Resolve-Path $p).ProviderPath }
# fallback: walk up to find first "docs"
  $cur = Get-Location
  for ($i=0; $i -lt 6; $i++) {
    $p = Join-Path $cur.Path 'docs'
    if (Test-Path $p) { return (Resolve-Path $p).ProviderPath }
    $parent = Split-Path -Parent $cur.Path
    if (-not $parent -or $parent -eq $cur.Path) { break }
    $cur = Get-Item -LiteralPath $parent
}

  throw "Docs folder not found. Pass -Root <repo> or -Docs <path-to-docs>."
}

function Normalize-Encoding {
  param([string]$FilePath)
  $text = [System.IO.File]::ReadAllText($FilePath, [System.Text.Encoding]::UTF8)
  [System.IO.File]::WriteAllText($FilePath, $text, $Utf8NoBom)
}
# one-glyph line (candidate to be glued to previous heading)
function Is-SingleGlyphLine {
  param([string]$s)
  $t = $s.Trim()
  if ($t.Length -eq 0) { return $false }
  if ($t.Length -gt 2) { return $false }
# allow any letter/number and basic punctuation only (ASCII range here)
  return ($t -match '^[\p{L}\p{N}\.\,\-\(\):]$')
}

function Fix-HeadingsInLines {
  param([string[]]$Lines)

  $out = New-Object System.Collections.Generic.List[string]
  $i = 0
  $changed = $false

  while ($i -lt $Lines.Count) {
    $line = $Lines[$i]
# match markdown heading
    $m = [regex]::Match($line, '^\s*(#{1,6})\s*(.*)$')
    if ($m.Success) {
      $hashes = $m.Groups[1].Value
      $title  = $m.Groups[2].Value
# case 1: heading text empty or extremely short -> try to glue subsequent single-glyph lines
      if ([string]::IsNullOrWhiteSpace($title) -or $title.Trim().Length -le 2) {
        $j = $i + 1
        $letters = New-Object System.Collections.Generic.List[string]
        while ($j -lt $Lines.Count -and (Is-SingleGlyphLine $Lines[$j])) {
          $letters.Add($Lines[$j].Trim())
          $j++
}
        if ($letters.Count -gt 0) {
          $newTitle = ($title.Trim() + ' ' + ($letters -join '')).Trim()
          $out.Add("$hashes $newTitle")
          $changed = $true
          $i = $j
          continue
}
}
# case 2: next lines are single-glyph -> glue to current heading
      if (($i + 1) -lt $Lines.Count -and (Is-SingleGlyphLine $Lines[$i + 1])) {
        $letters = New-Object System.Collections.Generic.List[string]
        $j = $i + 1
        while ($j -lt $Lines.Count -and (Is-SingleGlyphLine $Lines[$j])) {
          $letters.Add($Lines[$j].Trim())
          $j++
}
        $newTitle = ($title.Trim() + ' ' + ($letters -join '')).Trim()
        $out.Add("$hashes $newTitle")
        $changed = $true
        $i = $j
        continue
}
# normalize: single space after hashes
      $norm = "$hashes $($title.Trim())"
      if ($norm -ne $line) { $changed = $true }
      $out.Add($norm)
      $i++
      continue
}
# case 3: current line single-glyph and previous line is a heading -> append (no extra space)
    if ($out.Count -gt 0 -and (Is-SingleGlyphLine $line) -and ($out[$out.Count-1] -match '^\s*#{1,6}\s+\S')) {
      $prev = $out[$out.Count-1]
      $prev = $prev.TrimEnd() + $line.Trim()
      $out[$out.Count-1] = $prev
      $changed = $true
      $i++
      continue
}

    $out.Add($line)
    $i++
}

  return @{ Lines = $out; Changed = $changed }
}

function Process-File {
  param([System.IO.FileInfo]$File,[switch]$WhatIf)

  $orig = [System.IO.File]::ReadAllText($File.FullName, [System.Text.Encoding]::UTF8)
  $lines = $orig -split "`r?`n", 0

  $res = Fix-HeadingsInLines -Lines $lines
  $newText = ($res.Lines -join "`n")

  if ($res.Changed -or $newText -ne ($lines -join "`n")) {
    if ($WhatIf) {
      Write-Host "[WhatIf] fix: $($File.FullName)"
    } else {
      [System.IO.File]::WriteAllText($File.FullName, $newText, $Utf8NoBom)
      Normalize-Encoding -FilePath $File.FullName
      Write-Host "[OK]     fix: $($File.FullName)"
}
  } else {
    Write-Host "[.]      skip: $($File.FullName)"
}
}
# -------- main --------
$docsPath = Resolve-DocsPath -Root $Root -Docs $Docs
Write-Host "[i] docs = $docsPath"

$mdFiles = Get-ChildItem -LiteralPath $docsPath -Recurse -File -Filter *.md |
           Where-Object { -not ($_.FullName -match '\\(site|_site|node_modules|venv|.venv)\\') }

if (-not $mdFiles) {
  Write-Warning "No *.md files found under $docsPath"
  exit 0
}

foreach ($f in $mdFiles) {
  Process-File -File $f -WhatIf:$WhatIf
}

Write-Host "[OK] done."
