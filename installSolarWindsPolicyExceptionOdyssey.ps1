echo "testing if the agent is already installed."
if ( Test-Path -Path 'C:\Program Files\Advanced Monitoring Agent Network Management')
{
echo "Solarwinds Already Installed"
exit 1001
}
echo "Agent not installed.  Beginning install..."

######################  Change the URL
$dlfile = "AGENT_ODYSSEY_SYSTEMS_CONSULTING_GROUP_POLICY_EXCEPTIONS_V10_9_12_RW.ZIP"
$url = "https://github.com/BLKingLLC/filesToDownload/raw/master/$dlfile"
$agent = "AGENT_225361_V10_9_12_RW.exe"


#####################   Change the file name
$output = "$PSScriptRoot\$dlfile"
$start_time = Get-Date
echo $start_time



echo "Downloading Agent zip file..."
(New-Object System.Net.WebClient).DownloadFile($url, $output)
echo "Successfully Donwloaded Agent zip file"
echo "Extracting Agent zip file..."
#################### Change File Name

Expand-Archive -LiteralPath $PSScriptRoot\$dlfile -DestinationPath c:\tmp -Force
echo "Successfully Extracted Agent zip file"
echo "Running Agent Install Script..."

################### Change File Name
if (Test-Path -Path "c:\tmp\$agent" )
{
echo "file exists"
Start-Process -FilePath "c:\tmp\$agent"
} else 
{
echo "file does not exist"
}
echo "Install Completed"
exit 1002