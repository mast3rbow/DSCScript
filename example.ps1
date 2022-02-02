#Credential from Local Automation Credential -- Replace with Keyvault info
$creds = Get-AutomationPSCredential -Name "UserAccount-Cured"

# Replace with BLOB Storage solution - just used github as a simple way to get raw storage... plus i like version controls :P
$GitHubDSCConfig = 'https://raw.githubusercontent.com/mast3rbow/DSCScript/main/template.ps1'
 
# Default Azure automation Storage path and Date variables for ammending filenames
$path = "$env:TEMP"
$Date = $(Get-Date -f yyyy-MMM-dd-HHMMtt)

# Standard export DSC cmdlet - just examining Teams in workload - this will need to be expanded to other workloads very easily within M365 DSC
write-output "Pulling DSC from Tenant $Date"
Export-M365DSCConfiguration -Workloads @("TEAMS") -credential $creds -path $path -filename "runbook_$date.ps1" *>&1 | out-null

# Download fiels from github and create template
write-output "Pulling DSC from GitHub"
Invoke-RestMethod -Uri $GitHubDSCConfig -OutFile "$path\dscconfig_$date.ps1"
 
# Running Delta Report from DSC which compares Standard export with our blueprint (template)
write-output "Generating Delta Report`r`n"
New-m365dscdeltareport -source "$path\dscconfig_$date.ps1" -destination "$path\runbook_$date.ps1" -OutputPath "$path\DeltaNew_$date.HTML" *>&1 | out-null
 
# Reads file to our put log - could be sent back to API etc or sent to Blob storage.
$readfile = Get-Content -path "$path\DeltaNew_$date.HTML"
write-output $readfile
