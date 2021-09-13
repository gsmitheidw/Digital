$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'Digital*' 
}

Uninstall-ChocolateyZipPackage @packageArgs

# Remove Shortcut:
    if (Test-Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Digital.lnk") {

    Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Digital.lnk"

    }
