@ECHO OFF

@echo Checking for available updates...
start /wait /b "C:\Windows\System32\WindowsUpdate.exe" /quiet /detect

@echo Downloading and installing updates...
start /wait /b "C:\Windows\System32\WindowsUpdate.exe" /quiet /install

@echo Running SFC and DISM...
dism.exe /online /cleanup-image /startcomponentcleanup
dism.exe /online /cleanup-image /restore health
sfc /scannow

pause