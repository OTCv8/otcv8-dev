# scripts/Test-NoMojibake.ps1
$bad = Select-String -Path $args -Pattern '[ÂÃÄÅ]|ďż|Ã˘|Ă˘' -AllMatches
if($bad){ Write-Error "Found mojibake markers in: $($bad.Path | Select-Object -Unique -Join ', ')"; exit 1 }
