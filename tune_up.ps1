Install-Module PSWindowsUpdate
Import-Module PSWindowsUpdate

Get-WindowsUpdate -ListAvailable | Where-Object {$_.IsInstalled -eq $false } | Install-WindowsUpdate

Write-Output sfc.exe /scannow

Write-Output dism.exe /online /cleanup-image /scanhealth
Write-Output dism.exe /online /cleanup-image /restorehealth

Write-Output winget.exe upgrade --accept-package-agreements -r

Pause