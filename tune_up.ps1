Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate

Get-WindowsUpdate -ListAvailable | Where-Object {$_.IsInstalled -eq $false } | Install-WindowsUpdate

sfc.exe /scannow

dism.exe /online /cleanup-image /scanhealth
dism.exe /online /cleanup-image /restorehealth

winget.exe upgrade --accept-package-agreements -r