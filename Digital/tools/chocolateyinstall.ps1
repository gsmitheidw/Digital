$ErrorActionPreference = 'Stop'; 
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/hneemann/Digital/releases/download/v0.31/Digital.zip'

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url
  softwareName  = 'Digital*' 
  checksum      = '12F014C8B99140554F8F7464EBC771BBE3DE6AF39C83C20463492BCB892AFC69'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs

$target = Join-Path $toolsDir "Digital\$($packageName).exe"
Install-ChocolateyShortcut -shortcutFilePath "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Digital.lnk" -targetPath $target 

# We cannot set a specific dependency for Java Runtime as Oracle JRE, JDK and OpenJDK etc are all possible alternatives
# In light of this, check java.exe is on the path and warn the user if none found:

[bool]$javafound = (Get-Command java -ErrorAction SilentlyContinue).Name -eq 'java.exe'
	
	if ($javafound = $false) 
	{
	Write-Warning "Note: No Java Java Runtime found, this is required"
	}
