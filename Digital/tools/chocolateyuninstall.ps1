$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'Digital*' 
  checksum      = 'A93B9DD70ED5B051BF04AACC37F2794C3C3D17F214AB99F0C8F4A36E55BBE835'
  checksumType  = 'sha256' 
}

Uninstall-ChocolateyZipPackage @packageArgs

# Remove Shortcut:
    if (Test-Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Digital.lnk") {

    Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Digital.lnk"

    }