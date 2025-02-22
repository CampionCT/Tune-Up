@ECHO OFF

@echo Checking for available updates...
start /wait /b "C:\Windows\System32\WindowsUpdate.exe" /quiet /detect

@echo Downloading and installing updates...
start /wait /b "C:\Windows\System32\WindowsUpdate.exe" /quiet /install

@echo Running SFC and DISM...
dism.exe /online /cleanup-image /startcomponentcleanup
dism.exe /online /cleanup-image /restore health
sfc /scannow

@echo Running winget upgrade...

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%winget_upgrade.ps1
pwsh -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process pwsh -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}";

pause