param([string]$Path=".\\docs",[switch]$WhatIf)

$utf8 = New-Object Text.UTF8Encoding($false)
$rxFence = '^\s*```'
$rxTabs  = '^\t+|^ +\t+'
$rxHdrLead = '^\s+(#{1,6}\s+\S)'     # spacje przed #
$rxListMarker = '^( *)([-+*]|\d+\.)\s+'
$rxListIndent = '^( +)([-+*]|\d+\.)\s+'

$changed=0
Get-ChildItem -Path $Path -Recurse -Include *.md -File | ForEach-Object {
  $p=$_.FullName
  $inCode=$false
  $lines = Get-Content $p -Encoding UTF8
  $out = New-Object System.Collections.Generic.List[string]
  $touched=$false

  foreach($l in $lines){
    if ($l -match $rxFence){ $out.Add($l); $inCode = -not $inCode; continue }

    $m=$l
    if (-not $inCode){
      # 1) TABy -> 2 spacje na lewym brzegu
      if ($m -match $rxTabs){
        $m = $m -replace '^\t+', { '  ' * ($args[0].Value.Length) }
        $m = $m -replace '^ +\t+', '  '
        $touched=$true
      }
      # 2) spacje przed hashami nagłówka
      if ($m -match $rxHdrLead){
        $m = $m -replace '^\s+(#{1,6}\s+\S)','$1'
        $touched=$true
      }
      # 3) listy: dokładnie jedna spacja po markerze (-/*/1.)
      if ($m -match $rxListMarker){
        $m = $m -replace '^( *)([-+*]|\d+\.)\s+','$1$2 '
        $touched=$true
      }
      # 4) wcięcia list: wymuś parzystą liczbę spacji (zaokr. w dół do najbliższej parzystej)
      if ($m -match $rxListIndent){
        $n=$Matches[1].Length; if ($n -gt 0 -and ($n % 2 -ne 0)){
          $m = (' ' * ($n-1)) + $m.Substring($n)
          $touched=$true
        }
      }
    }
    $out.Add($m)
  }

  if ($touched){
    if ($WhatIf){ "Would fix: $p" }
    else{
      $text = ($out -join "`n")
      [IO.File]::WriteAllText($p,$text,$utf8)
      "Fixed: $p"; $changed++
    }
  }
}

if (-not $WhatIf){ "Changed: $changed file(s)" }
