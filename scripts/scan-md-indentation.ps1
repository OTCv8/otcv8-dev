param([string]$Path=".\\docs")

$rxFence = '^\s*```'
$rxTabOut = '^\t+|^ +\t+'
$rxBadHdr = '^\s+#{1,6}\s+\S'                 # spacje przed # (poza początkiem)
$rxList   = '^(?<indent> +)([-+*]|\d+\.)\s+'  # listy z za dużym wcięciem
$rxMultiSpAfterMarker = '^( *([-+*]|\d+\.) ) {2,}\S' # za dużo spacji po markerze

Get-ChildItem -Path $Path -Recurse -Include *.md -File | ForEach-Object {
  $p=$_.FullName
  $inCode=$false; $i=0
  Get-Content $p -Encoding UTF8 | ForEach-Object {
    $i++
    if ($_ -match $rxFence) { $inCode = -not $inCode; return }
    if (-not $inCode) {
      if ($_ -match $rxTabOut)            { "{0}:{1}  TAB outside code: {2}" -f $p,$i,$_.Replace("`t","\\t") }
      if ($_ -match $rxBadHdr)            { "{0}:{1}  Header leading spaces: {2}" -f $p,$i,$_.TrimEnd() }
      if ($_ -match $rxList) {
        $ind=$Matches['indent'].Length
        if ($ind % 2 -ne 0)               { "{0}:{1}  List indent not multiple of 2: {2}" -f $p,$i,$_.TrimEnd() }
      }
      if ($_ -match $rxMultiSpAfterMarker) { "{0}:{1}  Too many spaces after list marker: {2}" -f $p,$i,$_.TrimEnd() }
    }
  }
}
