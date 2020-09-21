if ( Test-Path -Path 'C:\Program FIles\winlogbeat')
{
write-host "updating winlogbeat.yml"
$url = "https://github.com/BLKingLLC/filesToDownload/raw/master/winlogbeat.yml"
$output = "$PSScriptRoot\winlogbeat.yml"
(New-Object System.Net.WebClient).DownloadFile($url, $output)
Copy-Item -Path $output -Destination "C:\Program Files\Winlogbeat\winlogbeat.yml" -Force
Stop-Service winlogbeat
Start-Service winlogbeat
} else {
exit 0 
}
