Stop-Service winlogbeat -force
$ScriptToRun= "C:\Program Files\winlogbeat\uninstall-service-winlogbeat.ps1"
Remove-Item -path "C:\Program Files\winlogbeat\" -Force
exit $LASTEXITCODE