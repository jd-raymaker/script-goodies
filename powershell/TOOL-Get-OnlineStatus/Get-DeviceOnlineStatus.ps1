# Script location
$ScriptDir = Split-Path $script:MyInvocation.MyCommand.Path

# Load file with hostnames and run ping on each one
$devices = [System.IO.File]::ReadLines("$ScriptDir\devices.txt") | ForEach-Object {
    Test-Connection -ComputerName $_ -Count 1 -AsJob
    Write-Host "Testing connection to $_"
} | Get-Job | Receive-Job -Wait

Write-Host "Creating list..."

# Create a list of all devices with online status
$listDevices = $devices | Select-Object @{
    Name='ComputerName'; Expression={$_.Address}},@{
    Name='IPv4Adress'; Expression={$_.IPV4Address}},@{
    Name='Online'; Expression={
        if ($_.StatusCode -eq 0) {$true} else {$false}}}

Write-Host "Exporting list..."

# Save the results
$listDevices | Export-Csv -Path "$ScriptDir\devices.csv" -NoTypeInformation