# scripts/Clean-StructuredDocs.ps1
# Purpose: fix headings and filenames in docs/modules/structured/*
# All comments are ASCII only to avoid parser issues on some consoles.
# Content is saved as UTF-8.

[CmdletBinding(SupportsShouldProcess = $true)]
param(
  [string]$DocsRoot = ".\docs",
  [switch]$FixHeadings = $true,
  [switch]$FixFilenames = $true,
  [switch]$Force
)

Set-StrictMode -Version Latest

function Remove-LeadingPipes {
  param([string]$Line)
  return ($Line -replace '^[\|\s]+', '')
}

# Replace "# Modul" -> "# Modu{0142}" only for H1/H2 using regex callback
function Fix-Heading-Spelling {
  param([string]$Line)
  $pattern = '^(#{1,2}\s*)Modul\b'
  $callback = {
    param($m)
    $hashes = $m.Groups[1].Value
    $lchar = [char]0x0142  # Unicode for small l with stroke
    return "$hashes" + "Modu$lchar"
  }
  $fixed = [regex]::Replace($Line, $pattern, $callback)
  return $fixed
}

# Normalize spacing around ":" in H1/H2 that start with "Modu..."
function Normalize-ColonSpacing {
  param([string]$Line)
  $fixed = $Line -replace '^(#{1,2}\s*Modu\S*)\s*:\s*', '${1}: '
  return $fixed
}

function Normalize-Heading {
  param([string]$Text)
  $t = $Text
  $t = Remove-LeadingPipes -Line $t
  $t = Fix-Heading-Spelling -Line $t
  $t = Normalize-ColonSpacing -Line $t
  return $t
}

function Fix-FileHeading {
  param([string]$Path)

  $raw = Get-Content -Path $Path -Raw -Encoding utf8
  $lines = $raw -split "`r?`n"
  if ($lines.Count -eq 0) { return $false }

  # find first non-empty line
  $idx = 0
  while ($idx -lt $lines.Count -and [string]::IsNullOrWhiteSpace($lines[$idx])) { $idx++ }
  if ($idx -ge $lines.Count) { return $false }

  $first = $lines[$idx]
  if ($first -notmatch '^\s*\#') { return $false }

  $fixedFirst = Normalize-Heading -Text $first
  if ($fixedFirst -ne $first) {
    $lines[$idx] = $fixedFirst
    $new = ($lines -join "`r`n")
    if ($PSCmdlet.ShouldProcess($Path, "Fix heading")) {
      $new | Set-Content -Path $Path -Encoding utf8
    }
    return $true
  }
  return $false
}

# File rename: convert underscores to hyphens but only after "modul-"
function To-HyphenName {
  param([string]$Name)
  if ($Name -notmatch '^modul-') { return $Name }
  $tail = $Name.Substring(6)
  return 'modul-' + ($tail -replace '_', '-')
}

function Fix-FileName {
  param([IO.FileInfo]$File, [switch]$Force)

  $name = $File.Name
  $target = To-HyphenName -Name $name
  if ($target -eq $name) { return $false }

  $dest = Join-Path $File.DirectoryName $target
  if (Test-Path $dest) {
    if (-not $Force) {
      Write-Warning "Target exists, skipping rename (use -Force to overwrite): $dest"
      return $false
    }
    Remove-Item -Path $dest -Force
  }

  if ($PSCmdlet.ShouldProcess($File.FullName, "Rename -> $target")) {
    Rename-Item -Path $File.FullName -NewName $target -Force
  }
  return $true
}

# -------- Main --------
$root = Convert-Path $DocsRoot
$structured = Join-Path $root "modules\structured"

if (-not (Test-Path $structured)) {
  Write-Error "Path not found: $structured"
  exit 1
}

$changed = 0

if ($FixHeadings) {
  Get-ChildItem $structured -Recurse -Filter "modul-*.md" -File | ForEach-Object {
    if (Fix-FileHeading -Path $_.FullName) {
      Write-Host "HEAD FIX -> $($_.FullName)" -ForegroundColor Green
      $changed++
    }
  }
}

if ($FixFilenames) {
  Get-ChildItem $structured -Recurse -Filter "modul-*.md" -File | ForEach-Object {
    if (Fix-FileName -File $_ -Force:$Force) {
      Write-Host "RENAME   -> $($_.FullName)" -ForegroundColor Cyan
      $changed++
    }
  }
}

if ($changed -eq 0) {
  Write-Host "No changes." -ForegroundColor Yellow
}
else {
  Write-Host ("Done. Changed items: {0}" -f $changed) -ForegroundColor Green
}
