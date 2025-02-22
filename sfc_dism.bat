@echo OFF
dism.exe /online /cleanup-image /startcomponentcleanup
dism.exe /online /cleanup-image /restore health
sfc /scannow
pause