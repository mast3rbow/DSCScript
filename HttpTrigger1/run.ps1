using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Import Required Modules. AzureADPreview has to be explicitily imported as
# a Windows PowerShell module before we can import the Microsoft365DSC module.
Import-Module PSDesiredStateConfiguration -Force
#Import-Module AzureADPreview -UseWindowsPowerShell -Force
Import-Module Microsoft365DSC -UseWindowsPowerShell -Force
Enable-ExperimentalFeature PSDesiredStateConfiguration.InvokeDscResource

# Retrieve the method to call (Get/Set/Test) from the query string.
# Default to Test is non passed;
$Method = "Test"
if (-not [System.String]::IsNullOrEmpty($Request.Query.Method)) {
    $Method = $Request.Query.Method
}

# Retrieve the Configuration's URL from QueryString
$ConfigurationURL = $Request.Query.ConfigurationURL

# Retrieve Credentials from Azure Key Vault
#[string]$userName = (Get-AzKeyVaultSecret -vaultName "" -name "UserName").SecretValueText
[string]$userName = "automation@curedcompliance.com"
#[string]$userPassword = (Get-AzKeyVaultSecret -vaultName "" -name "AccountPassword").SecretValueText
[string]$UserPassword = "Sol86205"
[securestring]$secStringPassword = ConvertTo-SecureString $userPassword -AsPlainText -Force
[pscredential]$creds = New-Object System.Management.Automation.PSCredential ($userName, $secStringPassword)

# Retrieve the configuration's content from the web
$Configuration = Invoke-WebRequest -Uri $ConfigurationURL -UseBasicParsing
$ConfigurationContent = $Configuration.RawContent

# Parse the DSC content into an array of PowerShell Objects using the DSCParser;
$ConfigurationComponents = ConvertTo-DSCObject -Content $ConfigurationContent

# For each DSC Resource block in the parsed array, replace the credentials by
# the ones retrieved from Azure Key Vault, and dynamically call into the
# Invoke-DSCResource cmdlet.
foreach ($DSCResourceBlock in $ConfigurationComponents) {
    # Replace the credentials by the ones from Azure Key Vault;
    $DSCResourceBlock.GlobalAdminAccount = $creds

    # Obtain the ResourceName property from the parsed DSC content
    $ResourceName = $DSCResourceBlock.ResourceName

    # Remove the ResourceName property which is created by the DSC parser
    # for usability purpose but which is never part of the set of
    # accepted parameters of the resource.
    $DSCResourceBlock.Remove("ResourceName") | Out-Null

    # Dynamically call the Invoke-DSCResource cmdlet.
    Invoke-DSCResource -ModuleName Microsoft365DSC `
        -Name $ResourceName `
        -Property $DSCResourceBlock `
        -Method $Method -Verbose | Out-Null
}
$body = "Successfully called the {$Method} Method on configuration {$ConfigurationURL}"

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $body
    })