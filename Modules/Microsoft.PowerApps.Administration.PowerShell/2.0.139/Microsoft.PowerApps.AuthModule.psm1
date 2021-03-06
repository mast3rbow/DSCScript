$local:ErrorActionPreference = "Stop"

Add-Type -Path (Join-Path (Split-Path $script:MyInvocation.MyCommand.Path) "Microsoft.Identity.Client.dll")

function Get-JwtTokenClaims
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string]$JwtToken
    )

    $tokenSplit = $JwtToken.Split(".")
    $claimsSegment = $tokenSplit[1].Replace(" ", "+").Replace("-", "+").Replace('_', '/');
    
    $mod = $claimsSegment.Length % 4
    if ($mod -gt 0)
    {
        $paddingCount = 4 - $mod;
        for ($i = 0; $i -lt $paddingCount; $i++)
        {
            $claimsSegment += "="
        }
    }

    $decodedClaimsSegment = [System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String($claimsSegment))

    return ConvertFrom-Json $decodedClaimsSegment
}


function Get-DefaultAudienceForEndPoint
{
    [CmdletBinding()]
    Param(
        [string] $Endpoint
    )

    $audienceMapping = @{
        "prod" = "https://service.powerapps.com/";
        "preview" = "https://service.powerapps.com/";
        "tip1"= "https://service.powerapps.com/";
        "tip2"= "https://service.powerapps.com/";
        "usgov"= "https://gov.service.powerapps.us/";
        "usgovhigh"= "https://high.service.powerapps.us/";
        "dod" = "https://service.apps.appsplatform.us/";
        "china" = "https://service.powerapps.cn/";
    }

    if ($null -ne $audienceMapping[$Endpoint])
    {
        return $audienceMapping[$Endpoint];
    }

    Write-Verbose "Unknown endpoint $Endpoint. Using https://service.powerapps.com/ as a default";
    return "https://service.powerapps.com/";
}

function Await-Task {
    param (
        [Parameter(ValueFromPipeline=$true, Mandatory=$true)]
        $task
    )

    process {
        while (-not $task.AsyncWaitHandle.WaitOne(200)) { }
        $task.GetAwaiter().GetResult()
    }
}

function Add-PowerAppsAccount
{
    <#
    .SYNOPSIS
    Add PowerApps account.
    .DESCRIPTION
    The Add-PowerAppsAccount cmdlet logins the user or application account and save login information to cache. 
    Use Get-Help Add-PowerAppsAccount -Examples for more detail.
    .PARAMETER Audience
    The service audience which is used for login.
    .PARAMETER Endpoint
    The serivce endpoint which to call. The value can be "prod", "preview", "tip1", "tip2", "usgov", "dod", "usgovhigh", or "china".
    .PARAMETER Username
    The user name used for login.
    .PARAMETER Password
    The password for the user.
    .PARAMETER TenantID
    The tenant Id of the user or application.
    .PARAMETER CertificateThumbprint
    The certificate thumbprint of the application.
    .PARAMETER ClientSecret
    The client secret of the application.
    .PARAMETER ApplicationId
    The application Id.
    .EXAMPLE
    Add-PowerAppsAccount
    Login to "prod" endpoint.
    .EXAMPLE
    Add-PowerAppsAccount -Endpoint "prod" -Username "username@test.onmicrosoft.com" -Password "password"
    Login to "prod" for user "username@test.onmicrosoft.com" by using password "password"
    .EXAMPLE
    Add-PowerAppsAccount `
      -Endpoint "tip1" `
      -TenantID 1a1fbe33-1ff4-45b2-90e8-4628a5112345 `
      -ClientSecret ABCDE]NO_8:YDLp0J4o-:?=K9cmipuF@ `
      -ApplicationId abcdebd6-e62c-4f68-ab74-b046579473ad
    Login to "tip1" for application abcdebd6-e62c-4f68-ab74-b046579473ad in tenant 1a1fbe33-1ff4-45b2-90e8-4628a5112345 by using client secret.
    .EXAMPLE
    Add-PowerAppsAccount `
      -Endpoint "tip1" `
      -TenantID 1a1fbe33-1ff4-45b2-90e8-4628a5112345 `
      -CertificateThumbprint 12345137C1B2D4FED804DB353D9A8A18465C8027 `
      -ApplicationId 08627eb8-8eba-4a9a-8c49-548266012345
    Login to "tip1" for application 08627eb8-8eba-4a9a-8c49-548266012345 in tenant 1a1fbe33-1ff4-45b2-90e8-4628a5112345 by using certificate.
    #>
    [CmdletBinding()]
    param
    (
        [string] $Audience = "https://service.powerapps.com/",

        [Parameter(Mandatory = $false)]
        [ValidateSet("prod","preview","tip1", "tip2", "usgov", "usgovhigh", "dod", "china")]
        [string]$Endpoint = "prod",

        [string]$Username = $null,

        [SecureString]$Password = $null,

        [string]$TenantID = $null,

        [string]$CertificateThumbprint = $null,

        [string]$ClientSecret = $null,

        [string]$ApplicationId = "1950a258-227b-4e31-a9cf-717495945fc2"
    )

    if ($Audience -eq "https://service.powerapps.com/")
    {
        # It's the default audience - we should remap based on endpoint as needed
        $Audience = Get-DefaultAudienceForEndPoint($Endpoint)
    }
    $global:currentSession = $null
    Add-PowerAppsAccountInternal -Audience $Audience -Endpoint $Endpoint -Username $Username -Password $Password -TenantID $TenantID -CertificateThumbprint $CertificateThumbprint -ClientSecret $ClientSecret -ApplicationId $ApplicationId
}


function Add-PowerAppsAccountInternal
{
    param
    (
        [string] $Audience = "https://service.powerapps.com/",

        [Parameter(Mandatory = $false)]
        [ValidateSet("prod","preview","tip1", "tip2", "usgov", "usgovhigh", "dod", "china")]
        [string]$Endpoint = "prod",

        [string]$Username = $null,

        [SecureString]$Password = $null,

        [string]$TenantID = $null,

        [string]$CertificateThumbprint = $null,

        [string]$ClientSecret = $null,

        [string]$ApplicationId = "1950a258-227b-4e31-a9cf-717495945fc2"
    )

    [string[]]$scopes = "$Audience/.default"
    if ([string]::IsNullOrWhiteSpace($ApplicationId))
    {
        $ApplicationId = "1950a258-227b-4e31-a9cf-717495945fc2"
    }

    Write-Debug "Using appId, $ApplicationId"

    [Microsoft.Identity.Client.IClientApplicationBase]$clientBase = $null
    [Microsoft.Identity.Client.AuthenticationResult]$authResult = $null

    if ($global:currentSession.loggedIn -eq $true -and $global:currentSession.recursed -ne $true)
    {
        Write-Debug "Already logged in, checking for token for resource $Audience"
        $authResult = $null
        if ($global:currentSession.resourceTokens[$Audience] -ne $null)
        {
            if ($global:currentSession.resourceTokens[$Audience].accessToken -ne $null -and `
                $global:currentSession.resourceTokens[$Audience].expiresOn -ne $null -and `
                $global:currentSession.resourceTokens[$Audience].expiresOn -gt (Get-Date))
            {
                Write-Debug "Token found and value, returning"
                return
            }
            else
            {
                 # Already logged in with an account, silently asking for a token from MSAL which should refresh
                try
                {
                    Write-Debug "Already logged in, silently requesting token from MSAL"
                    $authResult = $global:currentSession.msalClientApp.AcquireTokenSilent($scopes, $global:currentSession.msalAccount).ExecuteAsync() | Await-Task
                }
                catch [Microsoft.Identity.Client.MsalUiRequiredException] 
                {
                    Write-Debug ('{0}: {1}' -f $_.Exception.GetType().Name, $_.Exception.Message)
                }
            }
        }

        if ($authResult -eq $null)
        {
            Write-Debug "No token found, reseting audience and recursing: $Audience"
            # Reset the current audience values and call Add-PowerAppsAccount again
            $global:currentSession.resourceTokens[$Audience] = $null
            $global:currentSession.recursed = $true

            Add-PowerAppsAccountInternal -Audience $Audience -Endpoint $Endpoint -Username $global:currentSession.username -Password $global:currentSession.password -TenantID $global:currentSession.InitialTenantId -CertificateThumbprint $global:currentSession.certificateThumbprint -ClientSecret $global:currentSession.clientSecret -ApplicationId $global:currentSession.applicationId
            $global:currentSession.recursed = $false

            # Afer recursing we can early return
            return
        }
    }
    else
    {
        [string] $jwtTokenForClaims = $null
        [Microsoft.Identity.Client.AzureCloudInstance] $authBaseUri =
            switch ($Endpoint)
                {
                    "usgov" { [Microsoft.Identity.Client.AzureCloudInstance]::AzurePublic }
                    "usgovhigh" { [Microsoft.Identity.Client.AzureCloudInstance]::AzureUsGovernment }
                    "dod"       { [Microsoft.Identity.Client.AzureCloudInstance]::AzureUsGovernment }
                    "china"       { [Microsoft.Identity.Client.AzureCloudInstance]::AzureChina }
                    default     { [Microsoft.Identity.Client.AzureCloudInstance]::AzurePublic }
                };

        [Microsoft.Identity.Client.AadAuthorityAudience] $aadAuthAudience = [Microsoft.Identity.Client.AadAuthorityAudience]::AzureAdAndPersonalMicrosoftAccount
        if ($Username -ne $null -and $Password -ne $null)
        {
            $aadAuthAudience = [Microsoft.Identity.Client.AadAuthorityAudience]::AzureAdMultipleOrgs
        }

        Write-Debug "Using $aadAuthAudience : $Audience : $ApplicationId"

        if (![string]::IsNullOrWhiteSpace($TenantID) -and `
            (![string]::IsNullOrWhiteSpace($ClientSecret) -or ![string]::IsNullOrWhiteSpace($CertificateThumbprint)))
        {
            $options = New-Object -TypeName Microsoft.Identity.Client.ConfidentialClientApplicationOptions
            $options.ClientId = $ApplicationId
            $options.TenantId = $TenantID

            [Microsoft.Identity.Client.IConfidentialClientApplication ]$ConfidentialClientApplication = $null

             if (![string]::IsNullOrWhiteSpace($CertificateThumbprint))
            {
                Write-Debug "Using certificate for token acquisition"
                $clientCertificate = Get-Item -Path Cert:\CurrentUser\My\$CertificateThumbprint
                $ConfidentialClientApplication = [Microsoft.Identity.Client.ConfidentialClientApplicationBuilder ]::Create($ApplicationId).WithCertificate($clientCertificate).Build()
            }
            else
            {
                Write-Debug "Using clientSecret for token acquisition"
                $ConfidentialClientApplication = [Microsoft.Identity.Client.ConfidentialClientApplicationBuilder ]::Create($ApplicationId).WithClientSecret($ClientSecret).Build()
            }

            $authResult = $ConfidentialClientApplication.AcquireTokenForClient($scopes).WithAuthority($authBaseuri, $TenantID, $true).ExecuteAsync() | Await-Task
            $clientBase = $ConfidentialClientApplication
        }
        else 
        {
            [Microsoft.Identity.Client.IPublicClientApplication]$PublicClientApplication = $null
            $PublicClientApplication = [Microsoft.Identity.Client.PublicClientApplicationBuilder]::Create($ApplicationId).WithAuthority($authBaseuri, $aadAuthAudience, $true).WithDefaultRedirectUri().Build()

            if ($Username -ne $null -and $Password -ne $null)
            {
                Write-Debug "Using username, password"
                $authResult = $PublicClientApplication.AcquireTokenByUsernamePassword($scopes, $UserName, $Password).ExecuteAsync() | Await-Task
            }
            else
            {
                Write-Debug "Using interactive login"
                $authResult = $PublicClientApplication.AcquireTokenInteractive($scopes).ExecuteAsync() | Await-Task
            }
            $clientBase = $PublicClientApplication
        }
    }

    if ($authResult -ne $null)
    {
        if (![string]::IsNullOrWhiteSpace($authResult.IdToken))
        {
            $jwtTokenForClaims = $authResult.IdToken
        }
        else
        {
            $jwtTokenForClaims = $authResult.AccessToken
        }

        $claims = Get-JwtTokenClaims -JwtToken $jwtTokenForClaims

        if ($global:currentSession.loggedIn -eq $true)
        {
           Write-Debug "Adding new audience to resourceToken map. Expires $authResult.ExpiresOn"
            # addition of a new token for a new audience
            $global:currentSession.resourceTokens[$Audience] = @{
                accessToken = $authResult.AccessToken;
                expiresOn = $authResult.ExpiresOn;
            };
        }
        else
        {
            Write-Debug "Adding first audience to resourceToken map. Expires $authResult.ExpiresOn"
            $global:currentSession = @{
                loggedIn = $true;
                recursed = $false;
                msalClientApp = $clientBase;
                msalAccount = $authResult.Account;
                upn = $claims.upn;
                InitialTenantId = $TenantID;
                tenantId = $claims.tid;
                userId = $claims.oid;
                applicationId = $ApplicationId;
                username = $Username;
                password = $Password;
                certificateThumbprint = $CertificateThumbprint;
                clientSecret = $ClientSecret;
                resourceTokens = @{
                    $Audience = @{
                        accessToken = $authResult.AccessToken;
                        expiresOn = $authResult.ExpiresOn;
                    }
                };
                selectedEnvironment = "~default";
                flowEndpoint = 
                    switch ($Endpoint)
                    {
                        "prod"      { "api.flow.microsoft.com" }
                        "usgov"     { "gov.api.flow.microsoft.us" }
                        "usgovhigh" { "high.api.flow.microsoft.us" }
                        "dod"       { "api.flow.appsplatform.us" }
                        "china"     { "api.powerautomate.cn" }
                        "preview"   { "preview.api.flow.microsoft.com" }
                        "tip1"      { "tip1.api.flow.microsoft.com"}
                        "tip2"      { "tip2.api.flow.microsoft.com" }
                        default     { throw "Unsupported endpoint '$Endpoint'"}
                    };
                powerAppsEndpoint = 
                    switch ($Endpoint)
                    {
                        "prod"      { "api.powerapps.com" }
                        "usgov"     { "gov.api.powerapps.us" }
                        "usgovhigh" { "high.api.powerapps.us" }
                        "dod"       { "api.apps.appsplatform.us" }
                        "china"     { "api.powerapps.cn" }
                        "preview"   { "preview.api.powerapps.com" }
                        "tip1"      { "tip1.api.powerapps.com"}
                        "tip2"      { "tip2.api.powerapps.com" }
                        default     { throw "Unsupported endpoint '$Endpoint'"}
                    };            
                bapEndpoint = 
                    switch ($Endpoint)
                    {
                        "prod"      { "api.bap.microsoft.com" }
                        "usgov"     { "gov.api.bap.microsoft.us" }
                        "usgovhigh" { "high.api.bap.microsoft.us" }
                        "dod"       { "api.bap.appsplatform.us" }
                        "china"     { "api.bap.partner.microsoftonline.cn" }
                        "preview"   { "preview.api.bap.microsoft.com" }
                        "tip1"      { "tip1.api.bap.microsoft.com"}
                        "tip2"      { "tip2.api.bap.microsoft.com" }
                        default     { throw "Unsupported endpoint '$Endpoint'"}
                    };      
                graphEndpoint = 
                    switch ($Endpoint)
                    {
                        "prod"      { "graph.windows.net" }
                        "usgov"     { "graph.windows.net" }
                        "usgovhigh" { "graph.windows.net" }
                        "dod"       { "graph.windows.net" }
                        "china"     { "graph.windows.net" }
                        "preview"   { "graph.windows.net" }
                        "tip1"      { "graph.windows.net"}
                        "tip2"      { "graph.windows.net" }
                        default     { throw "Unsupported endpoint '$Endpoint'"}
                    };
                cdsOneEndpoint = 
                    switch ($Endpoint)
                    {
                        "prod"      { "api.cds.microsoft.com" }
                        "usgov"     { "gov.api.cds.microsoft.us" }
                        "usgovhigh" { "high.api.cds.microsoft.us" }
                        "dod"       { "dod.gov.api.cds.microsoft.us" }
                        "china"     { "unsupported" }
                        "preview"   { "preview.api.cds.microsoft.com" }
                        "tip1"      { "tip1.api.cds.microsoft.com"}
                        "tip2"      { "tip2.api.cds.microsoft.com" }
                        default     { throw "Unsupported endpoint '$Endpoint'"}
                    };
            };
        }
    }
}


function Test-PowerAppsAccount
{
    <#
    .SYNOPSIS
    Test PowerApps account.
    .DESCRIPTION
    The Test-PowerAppsAccount cmdlet checks cache and calls Add-PowerAppsAccount if user account is not in cache.
    Use Get-Help Test-PowerAppsAccount -Examples for more detail.
    .EXAMPLE
    Test-PowerAppsAccount
    Check if user account is cached.
    #>
    [CmdletBinding()]
    param
    (
    )

    if (-not $global:currentSession -or $global:currentSession.loggedIn -ne $true)
    {
        Add-PowerAppsAccountInternal
    }
}

function Remove-PowerAppsAccount
{
    <#
    .SYNOPSIS
    Remove PowerApps account.
    .DESCRIPTION
    The Remove-PowerAppsAccount cmdlet removes the user or application login information from cache.
    Use Get-Help Remove-PowerAppsAccount -Examples for more detail.
    .EXAMPLE
    Remove-PowerAppsAccount
    Removes the login information from cache.
    #>
    [CmdletBinding()]
    param
    (
    )

    if ($global:currentSession -ne $null -and $global:currentSession.upn -ne $null)
    {
        Write-Verbose "Logging out $($global:currentSession.upn)"
    }
    else
    {
        Write-Verbose "No user logged in"
    }

    $global:currentSession = @{
        loggedIn = $false;
    };
}

function Get-JwtToken
{
    <#
    .SYNOPSIS
    Get user login token.
    .DESCRIPTION
    The Get-JwtToken cmdlet get the user or application login information from cache. It will call Add-PowerAppsAccount if login token expired.
    Use Get-Help Get-JwtToken -Examples for more detail.
    .EXAMPLE
    Get-JwtToken "https://service.powerapps.com/"
    Get login token for PowerApps "prod".
    #>
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string] $Audience
    )

    if ($global:currentSession -eq $null)
    {
        $global:currentSession = @{
            loggedIn = $false;
        };
    }

    Add-PowerAppsAccountInternal -Audience $Audience

    return $global:currentSession.resourceTokens[$Audience].accessToken;
}

function Invoke-OAuthDialog
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory=$true)]
        [string] $ConsentLinkUri
    )

    Add-Type -AssemblyName System.Windows.Forms
    $form = New-Object -TypeName System.Windows.Forms.Form -Property @{ Width=440; Height=640 }
    $web  = New-Object -TypeName System.Windows.Forms.WebBrowser -Property @{ Width=420; Height=600; Url=$ConsentLinkUri }
    $DocComp  = {
        $Global:uri = $web.Url.AbsoluteUri        
        if ($Global:uri -match "error=[^&]*|code=[^&]*")
        {
            $form.Close()
        }
    }
    $web.ScriptErrorsSuppressed = $true
    $web.Add_DocumentCompleted($DocComp)
    $form.Controls.Add($web)
    $form.Add_Shown({$form.Activate()})
    $form.ShowDialog() | Out-Null
    $queryOutput = [System.Web.HttpUtility]::ParseQueryString($web.Url.Query)

    $output = @{}

    foreach($key in $queryOutput.Keys)
    {
        $output["$key"] = $queryOutput[$key]
    }
    
    return $output
}


function Get-TenantDetailsFromGraph
{
    <#
    .SYNOPSIS
    Get my organization tenant details from graph.
    .DESCRIPTION
    The Get-TenantDetailsFromGraph function calls graph and gets my organization tenant details. 
    Use Get-Help Get-TenantDetailsFromGraph -Examples for more detail.
    .PARAMETER GraphApiVersion
    Graph version to call. The default version is "1.6".
    .EXAMPLE
    Get-TenantDetailsFromGraph
    Get my organization tenant details from graph by calling graph service in version 1.6.
    #>
    param
    (
        [string]$GraphApiVersion = "1.6"
    )

    process 
    {
        $TenantIdentifier = "myorganization"

        $route = "https://{graphEndpoint}/{tenantIdentifier}/tenantDetails`?api-version={graphApiVersion}" `
        | ReplaceMacro -Macro "{tenantIdentifier}" -Value $TenantIdentifier `
        | ReplaceMacro -Macro "{graphApiVersion}" -Value $GraphApiVersion;

        $graphResponse = InvokeApi -Method GET -Route $route
        
        if ($graphResponse.value -ne $null)
        {
            CreateTenantObject -TenantObj $graphResponse.value
        }
        else
        {
            return $graphResponse
        }
    }
}

#Returns users or groups from Graph
#wrapper on top of https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/users-operations & https://msdn.microsoft.com/en-us/library/azure/ad/graph/api/groups-operations 
function Get-UsersOrGroupsFromGraph(
)
{
    <#
    .SYNOPSIS
    Returns users or groups from Graph.
    .DESCRIPTION
    The Get-UsersOrGroupsFromGraph function calls graph and gets users or groups from Graph. 
    Use Get-Help Get-UsersOrGroupsFromGraph -Examples for more detail.
    .PARAMETER ObjectId
    User objec Id.
    .PARAMETER SearchString
    Search string.
    .PARAMETER GraphApiVersion
    Graph version to call. The default version is "1.6".
    .EXAMPLE
    Get-UsersOrGroupsFromGraph -ObjectId "12345ba9-805f-43f8-98f7-34fa34aa51a7"
    Get user with user object Id "12345ba9-805f-43f8-98f7-34fa34aa51a7" from graph by calling graph service in version 1.6.
    .EXAMPLE
    Get-UsersOrGroupsFromGraph -SearchString "gfd"
    Get users who's UserPrincipalName starting with "gfd" from graph by calling graph service in version 1.6.
    #>
    [CmdletBinding(DefaultParameterSetName="Id")]
    param
    (
        [Parameter(Mandatory = $true, ParameterSetName = "Id")]
        [string]$ObjectId,

        [Parameter(Mandatory = $true, ParameterSetName = "Search")]
        [string]$SearchString,

        [Parameter(Mandatory = $false, ParameterSetName = "Search")]
        [Parameter(Mandatory = $false, ParameterSetName = "Id")]
        [string]$GraphApiVersion = "1.6"
    )

    Process
    {
        if (-not [string]::IsNullOrWhiteSpace($ObjectId))
        {
            $userGraphUri = "https://graph.windows.net/myorganization/users/{userId}`?&api-version={graphApiVersion}" `
            | ReplaceMacro -Macro "{userId}" -Value $ObjectId `
            | ReplaceMacro -Macro "{graphApiVersion}" -Value $GraphApiVersion;

            $userGraphResponse = InvokeApi -Route $userGraphUri -Method GET
            
            If($userGraphResponse.StatusCode -eq $null)
            {
                CreateUserObject -UserObj $userGraphResponse
            }

            $groupsGraphUri = "https://graph.windows.net/myorganization/groups/{groupId}`?api-version={graphApiVersion}" `
            | ReplaceMacro -Macro "{groupId}" -Value $ObjectId `
            | ReplaceMacro -Macro "{graphApiVersion}" -Value $GraphApiVersion;

            $groupGraphResponse = InvokeApi -Route $groupsGraphUri -Method GET

            If($groupGraphResponse.StatusCode -eq $null)
            {
                CreateGroupObject -GroupObj $groupGraphResponse
            }
        }
        else 
        {
            $userFilter = "startswith(userPrincipalName,'$SearchString') or startswith(displayName,'$SearchString')"
    
            $userGraphUri = "https://graph.windows.net/myorganization/users`?`$filter={filter}&api-version={graphApiVersion}" `
            | ReplaceMacro -Macro "{filter}" -Value $userFilter `
            | ReplaceMacro -Macro "{graphApiVersion}" -Value $GraphApiVersion;

            $userGraphResponse = InvokeApi -Route $userGraphUri -Method GET
    
            foreach($user in $userGraphResponse.value)
            {
                CreateUserObject -UserObj $user
            }

            $groupFilter = "startswith(displayName,'$SearchString')"
    
            $groupsGraphUri = "https://graph.windows.net/myorganization/groups`?`$filter={filter}&api-version={graphApiVersion}" `
            | ReplaceMacro -Macro "{filter}" -Value $groupFilter `
            | ReplaceMacro -Macro "{graphApiVersion}" -Value $GraphApiVersion;

            $groupsGraphResponse = InvokeApi -Route $groupsGraphUri -Method GET
    
            foreach($group in $groupsGraphResponse.value)
            {
                CreateGroupObject -GroupObj $group
            }    
        }
    }
}


function CreateUserObject
{
    param
    (
        [Parameter(Mandatory = $true)]
        [object]$UserObj
    )

    return New-Object -TypeName PSObject `
        | Add-Member -PassThru -MemberType NoteProperty -Name ObjectType -Value $UserObj.objectType `
        | Add-Member -PassThru -MemberType NoteProperty -Name ObjectId -Value $UserObj.objectId `
        | Add-Member -PassThru -MemberType NoteProperty -Name UserPrincipalName -Value $UserObj.userPrincipalName `
        | Add-Member -PassThru -MemberType NoteProperty -Name Mail -Value $UserObj.mail `
        | Add-Member -PassThru -MemberType NoteProperty -Name DisplayName -Value $UserObj.displayName `
        | Add-Member -PassThru -MemberType NoteProperty -Name AssignedLicenses -Value $UserObj.assignedLicenses `
        | Add-Member -PassThru -MemberType NoteProperty -Name AssignedPlans -Value $UserObj.assignedLicenses `
        | Add-Member -PassThru -MemberType NoteProperty -Name Internal -Value $UserObj;
}

function CreateGroupObject
{
    param
    (
        [Parameter(Mandatory = $true)]
        [object]$GroupObj
    )

    return New-Object -TypeName PSObject `
        | Add-Member -PassThru -MemberType NoteProperty -Name ObjectType -Value $GroupObj.objectType `
        | Add-Member -PassThru -MemberType NoteProperty -Name Objectd -Value $GroupObj.objectId `
        | Add-Member -PassThru -MemberType NoteProperty -Name Mail -Value $GroupObj.mail `
        | Add-Member -PassThru -MemberType NoteProperty -Name DisplayName -Value $GroupObj.displayName `
        | Add-Member -PassThru -MemberType NoteProperty -Name Internal -Value $GroupObj;
}


function CreateTenantObject
{
    param
    (
        [Parameter(Mandatory = $true)]
        [object]$TenantObj
    )

    return New-Object -TypeName PSObject `
        | Add-Member -PassThru -MemberType NoteProperty -Name ObjectType -Value $TenantObj.objectType `
        | Add-Member -PassThru -MemberType NoteProperty -Name TenantId -Value $TenantObj.objectId `
        | Add-Member -PassThru -MemberType NoteProperty -Name Country -Value $TenantObj.countryLetterCode `
        | Add-Member -PassThru -MemberType NoteProperty -Name Language -Value $TenantObj.preferredLanguage `
        | Add-Member -PassThru -MemberType NoteProperty -Name DisplayName -Value $TenantObj.displayName `
        | Add-Member -PassThru -MemberType NoteProperty -Name Domains -Value $TenantObj.verifiedDomains `
        | Add-Member -PassThru -MemberType NoteProperty -Name Internal -Value $TenantObj;
}
# SIG # Begin signature block
# MIIjdQYJKoZIhvcNAQcCoIIjZjCCI2ICAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCA5Zf6WJ8JBCayZ
# 4p0heLPCYcb5zMkealW8zoAlpmeLnKCCDYEwggX/MIID56ADAgECAhMzAAAB32vw
# LpKnSrTQAAAAAAHfMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjAxMjE1MjEzMTQ1WhcNMjExMjAyMjEzMTQ1WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQC2uxlZEACjqfHkuFyoCwfL25ofI9DZWKt4wEj3JBQ48GPt1UsDv834CcoUUPMn
# s/6CtPoaQ4Thy/kbOOg/zJAnrJeiMQqRe2Lsdb/NSI2gXXX9lad1/yPUDOXo4GNw
# PjXq1JZi+HZV91bUr6ZjzePj1g+bepsqd/HC1XScj0fT3aAxLRykJSzExEBmU9eS
# yuOwUuq+CriudQtWGMdJU650v/KmzfM46Y6lo/MCnnpvz3zEL7PMdUdwqj/nYhGG
# 3UVILxX7tAdMbz7LN+6WOIpT1A41rwaoOVnv+8Ua94HwhjZmu1S73yeV7RZZNxoh
# EegJi9YYssXa7UZUUkCCA+KnAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUOPbML8IdkNGtCfMmVPtvI6VZ8+Mw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDYzMDA5MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAnnqH
# tDyYUFaVAkvAK0eqq6nhoL95SZQu3RnpZ7tdQ89QR3++7A+4hrr7V4xxmkB5BObS
# 0YK+MALE02atjwWgPdpYQ68WdLGroJZHkbZdgERG+7tETFl3aKF4KpoSaGOskZXp
# TPnCaMo2PXoAMVMGpsQEQswimZq3IQ3nRQfBlJ0PoMMcN/+Pks8ZTL1BoPYsJpok
# t6cql59q6CypZYIwgyJ892HpttybHKg1ZtQLUlSXccRMlugPgEcNZJagPEgPYni4
# b11snjRAgf0dyQ0zI9aLXqTxWUU5pCIFiPT0b2wsxzRqCtyGqpkGM8P9GazO8eao
# mVItCYBcJSByBx/pS0cSYwBBHAZxJODUqxSXoSGDvmTfqUJXntnWkL4okok1FiCD
# Z4jpyXOQunb6egIXvkgQ7jb2uO26Ow0m8RwleDvhOMrnHsupiOPbozKroSa6paFt
# VSh89abUSooR8QdZciemmoFhcWkEwFg4spzvYNP4nIs193261WyTaRMZoceGun7G
# CT2Rl653uUj+F+g94c63AhzSq4khdL4HlFIP2ePv29smfUnHtGq6yYFDLnT0q/Y+
# Di3jwloF8EWkkHRtSuXlFUbTmwr/lDDgbpZiKhLS7CBTDj32I0L5i532+uHczw82
# oZDmYmYmIUSMbZOgS65h797rj5JJ6OkeEUJoAVwwggd6MIIFYqADAgECAgphDpDS
# AAAAAAADMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0
# ZSBBdXRob3JpdHkgMjAxMTAeFw0xMTA3MDgyMDU5MDlaFw0yNjA3MDgyMTA5MDla
# MH4xCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMT
# H01pY3Jvc29mdCBDb2RlIFNpZ25pbmcgUENBIDIwMTEwggIiMA0GCSqGSIb3DQEB
# AQUAA4ICDwAwggIKAoICAQCr8PpyEBwurdhuqoIQTTS68rZYIZ9CGypr6VpQqrgG
# OBoESbp/wwwe3TdrxhLYC/A4wpkGsMg51QEUMULTiQ15ZId+lGAkbK+eSZzpaF7S
# 35tTsgosw6/ZqSuuegmv15ZZymAaBelmdugyUiYSL+erCFDPs0S3XdjELgN1q2jz
# y23zOlyhFvRGuuA4ZKxuZDV4pqBjDy3TQJP4494HDdVceaVJKecNvqATd76UPe/7
# 4ytaEB9NViiienLgEjq3SV7Y7e1DkYPZe7J7hhvZPrGMXeiJT4Qa8qEvWeSQOy2u
# M1jFtz7+MtOzAz2xsq+SOH7SnYAs9U5WkSE1JcM5bmR/U7qcD60ZI4TL9LoDho33
# X/DQUr+MlIe8wCF0JV8YKLbMJyg4JZg5SjbPfLGSrhwjp6lm7GEfauEoSZ1fiOIl
# XdMhSz5SxLVXPyQD8NF6Wy/VI+NwXQ9RRnez+ADhvKwCgl/bwBWzvRvUVUvnOaEP
# 6SNJvBi4RHxF5MHDcnrgcuck379GmcXvwhxX24ON7E1JMKerjt/sW5+v/N2wZuLB
# l4F77dbtS+dJKacTKKanfWeA5opieF+yL4TXV5xcv3coKPHtbcMojyyPQDdPweGF
# RInECUzF1KVDL3SV9274eCBYLBNdYJWaPk8zhNqwiBfenk70lrC8RqBsmNLg1oiM
# CwIDAQABo4IB7TCCAekwEAYJKwYBBAGCNxUBBAMCAQAwHQYDVR0OBBYEFEhuZOVQ
# BdOCqhc3NyK1bajKdQKVMBkGCSsGAQQBgjcUAgQMHgoAUwB1AGIAQwBBMAsGA1Ud
# DwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8GA1UdIwQYMBaAFHItOgIxkEO5FAVO
# 4eqnxzHRI4k0MFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcmwwXgYIKwYBBQUHAQEEUjBQME4GCCsGAQUFBzAChkJodHRwOi8vd3d3Lm1p
# Y3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dDIwMTFfMjAxMV8wM18y
# Mi5jcnQwgZ8GA1UdIASBlzCBlDCBkQYJKwYBBAGCNy4DMIGDMD8GCCsGAQUFBwIB
# FjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2RvY3MvcHJpbWFyeWNw
# cy5odG0wQAYIKwYBBQUHAgIwNB4yIB0ATABlAGcAYQBsAF8AcABvAGwAaQBjAHkA
# XwBzAHQAYQB0AGUAbQBlAG4AdAAuIB0wDQYJKoZIhvcNAQELBQADggIBAGfyhqWY
# 4FR5Gi7T2HRnIpsLlhHhY5KZQpZ90nkMkMFlXy4sPvjDctFtg/6+P+gKyju/R6mj
# 82nbY78iNaWXXWWEkH2LRlBV2AySfNIaSxzzPEKLUtCw/WvjPgcuKZvmPRul1LUd
# d5Q54ulkyUQ9eHoj8xN9ppB0g430yyYCRirCihC7pKkFDJvtaPpoLpWgKj8qa1hJ
# Yx8JaW5amJbkg/TAj/NGK978O9C9Ne9uJa7lryft0N3zDq+ZKJeYTQ49C/IIidYf
# wzIY4vDFLc5bnrRJOQrGCsLGra7lstnbFYhRRVg4MnEnGn+x9Cf43iw6IGmYslmJ
# aG5vp7d0w0AFBqYBKig+gj8TTWYLwLNN9eGPfxxvFX1Fp3blQCplo8NdUmKGwx1j
# NpeG39rz+PIWoZon4c2ll9DuXWNB41sHnIc+BncG0QaxdR8UvmFhtfDcxhsEvt9B
# xw4o7t5lL+yX9qFcltgA1qFGvVnzl6UJS0gQmYAf0AApxbGbpT9Fdx41xtKiop96
# eiL6SJUfq/tHI4D1nvi/a7dLl+LrdXga7Oo3mXkYS//WsyNodeav+vyL6wuA6mk7
# r/ww7QRMjt/fdW1jkT3RnVZOT7+AVyKheBEyIXrvQQqxP/uozKRdwaGIm1dxVk5I
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVSjCCFUYCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAd9r8C6Sp0q00AAAAAAB3zAN
# BglghkgBZQMEAgEFAKCBoDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQg5R0clJ6W
# P1JaZ5MxkeAtMqjG/s9BbN75tXRZyyrXCTgwNAYKKwYBBAGCNwIBDDEmMCSgEoAQ
# AFQAZQBzAHQAUwBpAGcAbqEOgAxodHRwOi8vdGVzdCAwDQYJKoZIhvcNAQEBBQAE
# ggEAVC4CBB/8AjgPsYJvIgqgn4rPY60A3QcyiokmEv+nadmU0GOAqZ4AN0+EMUES
# 0FYPUyJ+Pc6F3GrXOCiA0Kn09Gtld/HiuiC/oPUcg9ijJcl6hHO846MJG+GGUG4v
# CXicCkVqA6Jo0sKppYDIIHttdeeFnw5dx+FfVZqxVa4sM3LW++XkpMZeIMHQBAMg
# ++HZe5lpvAIh/ZA1qBj6DAY1wYhkNKz7eoZD+jGFEwk821n40g45u4j9/kswH4oY
# lcrf71WOcZ9DgLdsQ/CI9lODrFE7VXRLGVCKQbQHOA0wYGzn/41dNvAix0JcxJAv
# uzc0ig21bqpjeXrLO9Tw3kjJQKGCEuIwghLeBgorBgEEAYI3AwMBMYISzjCCEsoG
# CSqGSIb3DQEHAqCCErswghK3AgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFRBgsqhkiG
# 9w0BCRABBKCCAUAEggE8MIIBOAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQC
# AQUABCAtnpf3mleAgzjfgAOeBf1LozKZZsX3p4cTwW7FSk8+1wIGYYAbGChyGBMy
# MDIxMTEwMjE2MTU1NS43ODFaMASAAgH0oIHQpIHNMIHKMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSUwIwYDVQQLExxNaWNyb3NvZnQgQW1lcmlj
# YSBPcGVyYXRpb25zMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjoxMkJDLUUzQUUt
# NzRFQjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZaCCDjkw
# ggTxMIID2aADAgECAhMzAAABU9KCckVsV+OLAAAAAAFTMA0GCSqGSIb3DQEBCwUA
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMB4XDTIwMTExMjE4MjYwNVoX
# DTIyMDIxMTE4MjYwNVowgcoxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xJTAjBgNVBAsTHE1pY3Jvc29mdCBBbWVyaWNhIE9wZXJhdGlvbnMxJjAk
# BgNVBAsTHVRoYWxlcyBUU1MgRVNOOjEyQkMtRTNBRS03NEVCMSUwIwYDVQQDExxN
# aWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNlMIIBIjANBgkqhkiG9w0BAQEFAAOC
# AQ8AMIIBCgKCAQEAteu2dAezG/mzQgLlwuhBibBb4FQeot9P45eIJrVMKEBuc91q
# cUBzSY/rdiOH6RE0EC6MYqB0okfp2yRUZ091go3OlMGxgTJ0CYM4M1V6H1TxyAop
# omDRIh8vOj7whKVk/L2+o3xXGjlaDHvuMDdjam5TlgOKOsJhEFBZq26SmQfnEVSR
# e1hNS+jQ30YjxPV0X0ZPs82XfjCYbN3lka+41XRtdL1RJVd4atGBc34aO4Lj9y9G
# zMYpEct6T3uFuoO0MH+THMQ6TNAGrc/QjZLHAD8oeI2ThdH+3Yi9QRhE/3OL6fIk
# E5XyqhIQm7dxYvx6ueHMF4xNWlMc0L2uW/3m7QIDAQABo4IBGzCCARcwHQYDVR0O
# BBYEFMaii3NIKqmzMBlAt+BwbawxVkR1MB8GA1UdIwQYMBaAFNVjOlyKMZDzQ3t8
# RhvFM2hahW1VMFYGA1UdHwRPME0wS6BJoEeGRWh0dHA6Ly9jcmwubWljcm9zb2Z0
# LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1RpbVN0YVBDQV8yMDEwLTA3LTAxLmNy
# bDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUHMAKGPmh0dHA6Ly93d3cubWljcm9z
# b2Z0LmNvbS9wa2kvY2VydHMvTWljVGltU3RhUENBXzIwMTAtMDctMDEuY3J0MAwG
# A1UdEwEB/wQCMAAwEwYDVR0lBAwwCgYIKwYBBQUHAwgwDQYJKoZIhvcNAQELBQAD
# ggEBAJRovXl8+iBEPscBc0miUdycR7GonoMpvQ7EV3KX3e365U1Gf+YlZMhavGF8
# iqBCPu21TsyZU39zxfFHWAsuMrFmnurMyPm7M9vW6GKEZcEmsXUDoPYcJV9TJH3T
# J4SfiIsN+RFWKe6zFY3TfYummR5XSj/zw0DbvrsxB6GyjS6WbMXviyP4HcbiIhSQ
# ztzvXk7p9O8Vh34ZyMSdsEu8uTxB6XcWU0F9p71kdG43Zrea+ocuV9LDQ9V2YmlN
# mqZdVm/R2tm5zuAPJa3u8GY0vovFwVVSWhOC15nExXkJZWZXb6vMgZrw6OML4xTh
# VXJKsgUqQjDCaUas5KHRg8SdOjQwggZxMIIEWaADAgECAgphCYEqAAAAAAACMA0G
# CSqGSIb3DQEBCwUAMIGIMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3Rv
# bjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0
# aW9uMTIwMAYDVQQDEylNaWNyb3NvZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3Jp
# dHkgMjAxMDAeFw0xMDA3MDEyMTM2NTVaFw0yNTA3MDEyMTQ2NTVaMHwxCzAJBgNV
# BAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4w
# HAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29m
# dCBUaW1lLVN0YW1wIFBDQSAyMDEwMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
# CgKCAQEAqR0NvHcRijog7PwTl/X6f2mUa3RUENWlCgCChfvtfGhLLF/Fw+Vhwna3
# PmYrW/AVUycEMR9BGxqVHc4JE458YTBZsTBED/FgiIRUQwzXTbg4CLNC3ZOs1nMw
# VyaCo0UN0Or1R4HNvyRgMlhgRvJYR4YyhB50YWeRX4FUsc+TTJLBxKZd0WETbijG
# GvmGgLvfYfxGwScdJGcSchohiq9LZIlQYrFd/XcfPfBXday9ikJNQFHRD5wGPmd/
# 9WbAA5ZEfu/QS/1u5ZrKsajyeioKMfDaTgaRtogINeh4HLDpmc085y9Euqf03GS9
# pAHBIAmTeM38vMDJRF1eFpwBBU8iTQIDAQABo4IB5jCCAeIwEAYJKwYBBAGCNxUB
# BAMCAQAwHQYDVR0OBBYEFNVjOlyKMZDzQ3t8RhvFM2hahW1VMBkGCSsGAQQBgjcU
# AgQMHgoAUwB1AGIAQwBBMAsGA1UdDwQEAwIBhjAPBgNVHRMBAf8EBTADAQH/MB8G
# A1UdIwQYMBaAFNX2VsuP6KJcYmjRPZSQW9fOmhjEMFYGA1UdHwRPME0wS6BJoEeG
# RWh0dHA6Ly9jcmwubWljcm9zb2Z0LmNvbS9wa2kvY3JsL3Byb2R1Y3RzL01pY1Jv
# b0NlckF1dF8yMDEwLTA2LTIzLmNybDBaBggrBgEFBQcBAQROMEwwSgYIKwYBBQUH
# MAKGPmh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9wa2kvY2VydHMvTWljUm9vQ2Vy
# QXV0XzIwMTAtMDYtMjMuY3J0MIGgBgNVHSABAf8EgZUwgZIwgY8GCSsGAQQBgjcu
# AzCBgTA9BggrBgEFBQcCARYxaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL1BLSS9k
# b2NzL0NQUy9kZWZhdWx0Lmh0bTBABggrBgEFBQcCAjA0HjIgHQBMAGUAZwBhAGwA
# XwBQAG8AbABpAGMAeQBfAFMAdABhAHQAZQBtAGUAbgB0AC4gHTANBgkqhkiG9w0B
# AQsFAAOCAgEAB+aIUQ3ixuCYP4FxAz2do6Ehb7Prpsz1Mb7PBeKp/vpXbRkws8LF
# Zslq3/Xn8Hi9x6ieJeP5vO1rVFcIK1GCRBL7uVOMzPRgEop2zEBAQZvcXBf/XPle
# FzWYJFZLdO9CEMivv3/Gf/I3fVo/HPKZeUqRUgCvOA8X9S95gWXZqbVr5MfO9sp6
# AG9LMEQkIjzP7QOllo9ZKby2/QThcJ8ySif9Va8v/rbljjO7Yl+a21dA6fHOmWaQ
# jP9qYn/dxUoLkSbiOewZSnFjnXshbcOco6I8+n99lmqQeKZt0uGc+R38ONiU9Mal
# CpaGpL2eGq4EQoO4tYCbIjggtSXlZOz39L9+Y1klD3ouOVd2onGqBooPiRa6YacR
# y5rYDkeagMXQzafQ732D8OE7cQnfXXSYIghh2rBQHm+98eEA3+cxB6STOvdlR3jo
# +KhIq/fecn5ha293qYHLpwmsObvsxsvYgrRyzR30uIUBHoD7G4kqVDmyW9rIDVWZ
# eodzOwjmmC3qjeAzLhIp9cAvVCch98isTtoouLGp25ayp0Kiyc8ZQU3ghvkqmqMR
# ZjDTu3QyS99je/WZii8bxyGvWbWu3EQ8l1Bx16HSxVXjad5XwdHeMMD9zOZN+w2/
# XU/pnR4ZOC+8z1gFLu8NoFA12u8JJxzVs341Hgi62jbb01+P3nSISRKhggLLMIIC
# NAIBATCB+KGB0KSBzTCByjELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjElMCMGA1UECxMcTWljcm9zb2Z0IEFtZXJpY2EgT3BlcmF0aW9uczEmMCQG
# A1UECxMdVGhhbGVzIFRTUyBFU046MTJCQy1FM0FFLTc0RUIxJTAjBgNVBAMTHE1p
# Y3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoBATAHBgUrDgMCGgMVAIpKTe3H
# DtZPTyghgr2kFisiedGboIGDMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENB
# IDIwMTAwDQYJKoZIhvcNAQEFBQACBQDlK0JVMCIYDzIwMjExMTAyMTI1MTMzWhgP
# MjAyMTExMDMxMjUxMzNaMHQwOgYKKwYBBAGEWQoEATEsMCowCgIFAOUrQlUCAQAw
# BwIBAAICC0swBwIBAAICEWcwCgIFAOUsk9UCAQAwNgYKKwYBBAGEWQoEAjEoMCYw
# DAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgCAQACAwGGoDANBgkqhkiG9w0B
# AQUFAAOBgQBTKDL3m/w0MoVEB84MYa8c8g2bC8FbFRxzBEzGH3Ck4AXr9KRcYqE4
# cv5uIC/CBafHWqeBEUoCCf9cBi7RQxHdYTQUcSjSc4WLiiQLfHfbS9sf/4mUmV7Q
# tBGWZW2daAu1dtEhVN3LJ3IgDk4IIA/6pcaIVubdSP8eZRf32rCpsDGCAw0wggMJ
# AgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYD
# VQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAk
# BgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwAhMzAAABU9KCckVs
# V+OLAAAAAAFTMA0GCWCGSAFlAwQCAQUAoIIBSjAaBgkqhkiG9w0BCQMxDQYLKoZI
# hvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIK0jepjKhL7+ErnNnVx2yk1ckpElCZxj
# Bdw2/oMiWef8MIH6BgsqhkiG9w0BCRACLzGB6jCB5zCB5DCBvQQgUMEKjzm0IAgJ
# /JehkEOmmh0sgxxvbA4fasQFaI21jwAwgZgwgYCkfjB8MQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1T
# dGFtcCBQQ0EgMjAxMAITMwAAAVPSgnJFbFfjiwAAAAABUzAiBCDcyIaJGq59x+f2
# We0dwpv6QqD84cJWl92LqP1l0RmGWDANBgkqhkiG9w0BAQsFAASCAQBCqH8KQMvP
# 7ZyaQaEueWdbjqewSqK5t/zw8QjIOrrv9Ye4WklGHCYAQj7eIK7nSESqYLgU/iQU
# Y9dDeRbwklWvwo8YPjvnXr82/ZyFwEJzxQzlr8HAZMJ76le9SX6mIDECw4x9luVe
# RGAelCZ4o9vvMGdzeX0zOYG5lSHczJTU+SSt84eB9IUhPJxnrb30AeU1rfTcmfZ4
# O5rDl81+MKIISSPh5hyEu6ssZ4bzmf40BV2I1mW6Hl8yNmsNDJlEFKKWz+9ra+2j
# wuvmfUMKFqt0sykT/A1TthLIx+FNZ6nsjuBZGFHvvbKQliBtvagTLwQwtuqzTnyo
# R0vm5NvqA4Zd
# SIG # End signature block
