@echo

SET ThisScriptsDirectory=%~dp0
SET PowerShellScriptPath=%ThisScriptsDirectory%tune_up.ps1
pwsh -NoProfile -ExecutionPolicy Bypass -Command "& {Start-Process pwsh -ArgumentList '-NoProfile -ExecutionPolicy Bypass -File ""%PowerShellScriptPath%""' -Verb RunAs}"