Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate

Get-WindowsUpdate -ListAvailable | Where-Object {$_.IsInstalled -eq $false } | Install-WindowsUpdate

echo
sfc.exe /scannow

echo
dism.exe /online /cleanup-image /scanhealth
dism.exe /online /cleanup-image /restorehealth

echo
winget.exe upgrade --accept-package-agreements -r

Pause