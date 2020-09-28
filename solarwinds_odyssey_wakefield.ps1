if ( Test-Path -Path 'C:\Program FIles\Advanced Monitoring Agent Network Management')
{
echo "Solarwinds Already Installed"
exit 1001
}

$url = "https://github.com/BLKingLLC/filesToDownload/raw/master/AGENT_ODYSSEY_SYSTEMS_CONSULTING_GROUP_WAKEFIELD_OFFICES_V10_9_12_RW.ZIP"
$output = "$PSScriptRoot\AGENT_ODYSSEY_SYSTEMS_CONSULTING_GROUP_WAKEFIELD_OFFICES_V10_9_12_RW.ZIP"
$start_time = Get-Date
echo $start_time
#$wc = New-Object System.Net.WebClient
#$wc.DownloadFile($url, $output)
#OR
echo "Downloading Wakefield Agent zip file..."
(New-Object System.Net.WebClient).DownloadFile($url, $output)
echo "Successfully Donwloaded Wakefield Agent zip file"
echo "Extracting Wakefield Agent zip file..."
Expand-Archive -LiteralPath $PSScriptRoot\AGENT_ODYSSEY_SYSTEMS_CONSULTING_GROUP_WAKEFIELD_OFFICES_V10_9_12_RW.ZIP
echo "Successfully Extracted Wakefiled Agent zip file"
echo "Running Wakefield Agent Install Script..."
Start-Process -FilePath $PSScriptRoot\AGENT_ODYSSEY_SYSTEMS_CONSULTING_GROUP_WAKEFIELD_OFFICES_V10_9_12_RW\AGENT_224704_V10_9_12_RW.EXE
echo $LASTEXITCODE
echo "Install Completed"
exit $LASTEXITCODE