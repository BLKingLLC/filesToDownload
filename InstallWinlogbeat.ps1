$url = "https://github.com/BLKingLLC/filesToDownload/raw/master/Winlogbeat.zip"
$output = "$PSScriptRoot\Winlogbeat.zip"
$start_time = Get-Date

#$wc = New-Object System.Net.WebClient
#$wc.DownloadFile($url, $output)
#OR
Write-Host "Downloading Winlogbeat zip file..."
(New-Object System.Net.WebClient).DownloadFile($url, $output)
Write-Host "Successfully Donwloaded Winlogbeat zip file"
Write-Host "Extracting Winlogbeat zip file..."
Expand-Archive -LiteralPath $PSScriptRoot\Winlogbeat.zip -DestinationPath "C:\Program Files\"
Write-Host "Successfully Extracted Winlogbeat zip file"
Write-Host "Running Winlogbeat Install Script..."
$ScriptToRun= "C:\Program Files\winlogbeat\install-service-winlogbeat.ps1"
&$ScriptToRun
Write-Host "Successfully ran install script."
Write-Host "Starting winlogbeat service..."
Start-Service winlogbeat
Write-Host "Started winlogbeat service."
