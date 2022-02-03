
# ----------------------------------------------------------------------------------
# Code generated by Microsoft (R) AutoRest Code Generator (autorest: 3.5.1, generator: @autorest/powershell@3.0.466)
# Changes may cause incorrect behavior and will be lost if the code is regenerated.
# ----------------------------------------------------------------------------------

<#
.Synopsis

.Description

.Example
PS C:\> {{ Add code here }}

{{ Add output here }}
.Example
PS C:\> {{ Add code here }}

{{ Add output here }}

.Inputs
Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.INewLocation
.Outputs
Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.ILocationSchema
.Notes
COMPLEX PARAMETER PROPERTIES

To create the parameters described below, construct a hash table containing the appropriate properties. For information on hash tables, run Get-Help about_Hash_Tables.

BODY <INewLocation>: .
  [AdditionalInfo <String>]: 
  [CityOrTown <String>]: 
  [CityOrTownAlias <String>]: 
  [CivicAddressId <String>]: 
  [CompanyId <String>]: 
  [CompanyName <String>]: 
  [Confidence <String>]: 
  [Country <String>]: 
  [CountyOrDistrict <String>]: 
  [Description <String>]: 
  [Elin <String>]: 
  [HouseNumber <String>]: 
  [HouseNumberSuffix <String>]: 
  [IsDefault <Boolean?>]: 
  [Latitude <String>]: 
  [Longitude <String>]: 
  [PartnerId <String>]: 
  [PostDirectional <String>]: 
  [PostalOrZipCode <String>]: 
  [PreDirectional <String>]: 
  [StateOrProvince <String>]: 
  [StreetName <String>]: 
  [StreetSuffix <String>]: 
  [TenantId <String>]: 
  [ValidationStatus <String>]: 
.Link
https://docs.microsoft.com/en-us/powershell/module/teams/new-csonlinelislocationmodern
#>
function New-CsOnlineLisLocationModern {
[OutputType([Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.ILocationSchema])]
[CmdletBinding(DefaultParameterSetName='NewExpanded', PositionalBinding=$false, SupportsShouldProcess, ConfirmImpact='Medium')]
param(
    [Parameter(ParameterSetName='New', Mandatory, ValueFromPipeline)]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Models.INewLocation]
    # .
    # To construct, see NOTES section for BODY properties and create a hash table.
    ${Body},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${City},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CityAlias},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CivicAddressId},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CompanyName},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CompanyTaxId},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Confidence},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CountryOrRegion},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${CountyOrDistrict},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Description},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Elin},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${HouseNumber},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${HouseNumberSuffix},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.Management.Automation.SwitchParameter]
    # .
    ${IsDefault},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Latitude},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Location},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${Longitude},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${PartnerId},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${PostDirectional},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${PostalCode},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${PreDirectional},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${StateOrProvince},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${StreetName},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${StreetSuffix},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${TenantId},

    [Parameter(ParameterSetName='NewExpanded')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Body')]
    [System.String]
    # .
    ${ValidationStatus},

    [Parameter(DontShow)]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Wait for .NET debugger to attach
    ${Break},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be appended to the front of the pipeline
    ${HttpPipelineAppend},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Runtime.SendAsyncStep[]]
    # SendAsync Pipeline Steps to be prepended to the front of the pipeline
    ${HttpPipelinePrepend},

    [Parameter(DontShow)]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [System.Uri]
    # The URI for the proxy server to use
    ${Proxy},

    [Parameter(DontShow)]
    [ValidateNotNull()]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [System.Management.Automation.PSCredential]
    # Credentials for a proxy server to use for the remote call
    ${ProxyCredential},

    [Parameter(DontShow)]
    [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Category('Runtime')]
    [System.Management.Automation.SwitchParameter]
    # Use the default credentials for the proxy
    ${ProxyUseDefaultCredentials}
)

begin {
    try {
        $outBuffer = $null
        if ($PSBoundParameters.TryGetValue('OutBuffer', [ref]$outBuffer)) {
            $PSBoundParameters['OutBuffer'] = 1
        }
        $parameterSet = $PSCmdlet.ParameterSetName
        $mapping = @{
            New = 'Microsoft.Teams.ConfigAPI.Cmdlets.private\New-CsOnlineLisLocationModern_New';
            NewExpanded = 'Microsoft.Teams.ConfigAPI.Cmdlets.private\New-CsOnlineLisLocationModern_NewExpanded';
        }
        $cmdInfo = Get-Command -Name $mapping[$parameterSet]
        [Microsoft.Teams.ConfigAPI.Cmdlets.Generated.Runtime.MessageAttributeHelper]::ProcessCustomAttributesAtRuntime($cmdInfo, $MyInvocation, $parameterSet, $PSCmdlet)
        $wrappedCmd = $ExecutionContext.InvokeCommand.GetCommand(($mapping[$parameterSet]), [System.Management.Automation.CommandTypes]::Cmdlet)
        $scriptCmd = {& $wrappedCmd @PSBoundParameters}
        $steppablePipeline = $scriptCmd.GetSteppablePipeline($MyInvocation.CommandOrigin)
        $steppablePipeline.Begin($PSCmdlet)
    } catch {
        throw
    }
}

process {
    try {
        $steppablePipeline.Process($_)
    } catch {
        throw
    }
}

end {
    try {
        $steppablePipeline.End()
    } catch {
        throw
    }
}
}

# SIG # Begin signature block
# MIInowYJKoZIhvcNAQcCoIInlDCCJ5ACAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCAiibt50U7TUPXi
# yV5MlmOIS+29ZLPls3o8DzlvelueVaCCDXMwggXxMIID2aADAgECAhMzAAACGYwK
# n7IWKxDmAAAAAAIZMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwNDI5MTkxMjU1WhcNMjIwNDI4MTkxMjU1WjByMQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMRwwGgYDVQQDExNTa3lw
# ZSBTb2Z0d2FyZSBTYXJsMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA
# nxMscK0w8ebaayvQhxPtLTkomfivSX4yNLmQJGXG+1yUKU4fmdQAhZm5mSIdFAEv
# sjAwCP3vUmh2N5R5TrAN/whfjGcDDlCYonKcrmuSaXxGuyjXKlELlRmPOaobqeo1
# 1Amcz6SRbNYBtKtRiP5ip2PfAvtJp7AvH0mZfGXKehE4C+5t8XYZ3K1JU3Tdb+3Z
# z+smovI8h/ZPe+uV2ORTxxa9kBLDvueJZbzKkn/WAIX/8rq/ywHtffSTXSueUmoe
# NJ0UCyoNBr90xtnozaCVknyRG8qWzHEZlc43FPNwIW6y8k1JSuspq+SML/HP7Fjv
# 7zcTLtM1HBBX/I9KxBJSBQIDAQABo4IBcjCCAW4wEwYDVR0lBAwwCgYIKwYBBQUH
# AwMwHQYDVR0OBBYEFAZqNYGuvWVnCVhV5aJBAvx4cJdwMFAGA1UdEQRJMEekRTBD
# MSkwJwYDVQQLEyBNaWNyb3NvZnQgT3BlcmF0aW9ucyBQdWVydG8gUmljbzEWMBQG
# A1UEBRMNMjMwMjU0KzQ2NDU2MjAfBgNVHSMEGDAWgBRIbmTlUAXTgqoXNzcitW2o
# ynUClTBUBgNVHR8ETTBLMEmgR6BFhkNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
# cGtpb3BzL2NybC9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3JsMGEGCCsG
# AQUFBwEBBFUwUzBRBggrBgEFBQcwAoZFaHR0cDovL3d3dy5taWNyb3NvZnQuY29t
# L3BraW9wcy9jZXJ0cy9NaWNDb2RTaWdQQ0EyMDExXzIwMTEtMDctMDguY3J0MAwG
# A1UdEwEB/wQCMAAwDQYJKoZIhvcNAQELBQADggIBABRKE3yDcJHa8xnyFn9Z+0m8
# vQLeUGC9933o78aSOWDkvcPFPczSqvw4cUmQnHPcRwDS1mwlYs5TmCdIS6Ij++Or
# uWxfgMdPRpveO6zT8rDWBL2sqCT/k5yCO75DVhT4kE/qEe81T4OY/Ejx3lZbBE1a
# z2k5dOL/ZWqNu8FdKSDmBZEeENOYy9UIyLf6coV2KLERB2IZ3W8U3z37fPA5nRMw
# +9sWWb98Gdm8exr4UwmnU0q8Y0KvJx/xwqOPShgiDjHsWev3fzsKSYzebkfBdLbw
# DZl9880mrGr03CfEWGDWa0tJui3LRh4csIuxWHkUrFw/R2N8baMDGPEUCh7dE+qf
# nuuMJ5tRUmnMOqyqj8dLXUZa+yxxpS91qde5asle0+WfzjLQ1D+T6ElhLBQU9LNh
# 5nhbD1+kJkVHFAU2tM3MXa2tgMVWFWQP4IqcQDWMW68M90VkGUrJ+t63oRO8HwbL
# 4IZJxG0wW/527ypSQTmpLSX6mM2vIyFHsO4zCvjDq8yfnDk25bpUNJbfOpqVkkWP
# UE+4bNIQbzcWgKgPIZDOka3pxq4vI05ns3tnvWS7TKiG+7ZYr5ZBSS6pr1Wykt0U
# aXxaUZuAWwikj2gvZAXR35f5bDg+36WoJTpQKNqzsY7dyL6SxkcZI8DcEKWEfbWd
# BX8q+w5hzEWqh7TrYJ93MIIHejCCBWKgAwIBAgIKYQ6Q0gAAAAAAAzANBgkqhkiG
# 9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEy
# MDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2VydGlmaWNhdGUgQXV0aG9yaXR5IDIw
# MTEwHhcNMTEwNzA4MjA1OTA5WhcNMjYwNzA4MjEwOTA5WjB+MQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSgwJgYDVQQDEx9NaWNyb3NvZnQgQ29k
# ZSBTaWduaW5nIFBDQSAyMDExMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKC
# AgEAq/D6chAcLq3YbqqCEE00uvK2WCGfQhsqa+laUKq4BjgaBEm6f8MMHt03a8YS
# 2AvwOMKZBrDIOdUBFDFC04kNeWSHfpRgJGyvnkmc6Whe0t+bU7IKLMOv2akrrnoJ
# r9eWWcpgGgXpZnboMlImEi/nqwhQz7NEt13YxC4Ddato88tt8zpcoRb0RrrgOGSs
# bmQ1eKagYw8t00CT+OPeBw3VXHmlSSnnDb6gE3e+lD3v++MrWhAfTVYoonpy4BI6
# t0le2O3tQ5GD2Xuye4Yb2T6xjF3oiU+EGvKhL1nkkDstrjNYxbc+/jLTswM9sbKv
# kjh+0p2ALPVOVpEhNSXDOW5kf1O6nA+tGSOEy/S6A4aN91/w0FK/jJSHvMAhdCVf
# GCi2zCcoOCWYOUo2z3yxkq4cI6epZuxhH2rhKEmdX4jiJV3TIUs+UsS1Vz8kA/DR
# elsv1SPjcF0PUUZ3s/gA4bysAoJf28AVs70b1FVL5zmhD+kjSbwYuER8ReTBw3J6
# 4HLnJN+/RpnF78IcV9uDjexNSTCnq47f7Fufr/zdsGbiwZeBe+3W7UvnSSmnEyim
# p31ngOaKYnhfsi+E11ecXL93KCjx7W3DKI8sj0A3T8HhhUSJxAlMxdSlQy90lfdu
# +HggWCwTXWCVmj5PM4TasIgX3p5O9JawvEagbJjS4NaIjAsCAwEAAaOCAe0wggHp
# MBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBRIbmTlUAXTgqoXNzcitW2oynUC
# lTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYDVR0T
# AQH/BAUwAwEB/zAfBgNVHSMEGDAWgBRyLToCMZBDuRQFTuHqp8cx0SOJNDBaBgNV
# HR8EUzBRME+gTaBLhklodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9w
# cm9kdWN0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3JsMF4GCCsGAQUF
# BwEBBFIwUDBOBggrBgEFBQcwAoZCaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3Br
# aS9jZXJ0cy9NaWNSb29DZXJBdXQyMDExXzIwMTFfMDNfMjIuY3J0MIGfBgNVHSAE
# gZcwgZQwgZEGCSsGAQQBgjcuAzCBgzA/BggrBgEFBQcCARYzaHR0cDovL3d3dy5t
# aWNyb3NvZnQuY29tL3BraW9wcy9kb2NzL3ByaW1hcnljcHMuaHRtMEAGCCsGAQUF
# BwICMDQeMiAdAEwAZQBnAGEAbABfAHAAbwBsAGkAYwB5AF8AcwB0AGEAdABlAG0A
# ZQBuAHQALiAdMA0GCSqGSIb3DQEBCwUAA4ICAQBn8oalmOBUeRou09h0ZyKbC5YR
# 4WOSmUKWfdJ5DJDBZV8uLD74w3LRbYP+vj/oCso7v0epo/Np22O/IjWll11lhJB9
# i0ZQVdgMknzSGksc8zxCi1LQsP1r4z4HLimb5j0bpdS1HXeUOeLpZMlEPXh6I/MT
# faaQdION9MsmAkYqwooQu6SpBQyb7Wj6aC6VoCo/KmtYSWMfCWluWpiW5IP0wI/z
# Rive/DvQvTXvbiWu5a8n7dDd8w6vmSiXmE0OPQvyCInWH8MyGOLwxS3OW560STkK
# xgrCxq2u5bLZ2xWIUUVYODJxJxp/sfQn+N4sOiBpmLJZiWhub6e3dMNABQamASoo
# PoI/E01mC8CzTfXhj38cbxV9Rad25UAqZaPDXVJihsMdYzaXht/a8/jyFqGaJ+HN
# pZfQ7l1jQeNbB5yHPgZ3BtEGsXUfFL5hYbXw3MYbBL7fQccOKO7eZS/sl/ahXJbY
# ANahRr1Z85elCUtIEJmAH9AAKcWxm6U/RXceNcbSoqKfenoi+kiVH6v7RyOA9Z74
# v2u3S5fi63V4GuzqN5l5GEv/1rMjaHXmr/r8i+sLgOppO6/8MO0ETI7f33VtY5E9
# 0Z1WTk+/gFcioXgRMiF670EKsT/7qMykXcGhiJtXcVZOSEXAQsmbdlsKgEhr/Xmf
# wb1tbWrJUnMTDXpQzTGCGYYwghmCAgEBMIGVMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTECEzMAAAIZjAqfshYrEOYAAAAAAhkwDQYJYIZIAWUDBAIBBQCg
# gaYwGQYJKoZIhvcNAQkDMQwGCisGAQQBgjcCAQQwHAYKKwYBBAGCNwIBCzEOMAwG
# CisGAQQBgjcCARUwLwYJKoZIhvcNAQkEMSIEIHB4+sfpyHNKdJVnJFeIGHZeLpyx
# T3d0Nx7aX2s44r0VMDoGCisGAQQBgjcCAQwxLDAqoAyACgBTAGsAeQBwAGWhGoAY
# aHR0cDovL3d3dy5taWNyb3NvZnQuY29tMA0GCSqGSIb3DQEBAQUABIIBAAoecbA/
# TbrLI+oPp1tSTFd8/KHUAhftbuxVEDJO4W7VQKdvV8C2OenHlIok42tD2E/6hxyd
# J0VbtG6bQtYqjrlPBM91i/gUkz1xn++pGydSm60rUMXgihV8apkbuCSBFAhWlCYd
# Q9eCZg2XuZjEXnrRVxDaHm+YD+bcEM+xLUL/2aiB9q+XjESf04qolapFAmU4G3vG
# 86q0Wmqnxt5Jx7skcJmh7EZW5ASHafBaHntcouFb8k9GmQg52EnQDN7oVUowMBgP
# mB8PIZkZ41BmvG6hxLjKXQjSGPjO8CpEaUYHam1CrfjoloyLI2PXSZ/an1+3CyxT
# 241agFOfX9uGuGqhghcYMIIXFAYKKwYBBAGCNwMDATGCFwQwghcABgkqhkiG9w0B
# BwKgghbxMIIW7QIBAzEPMA0GCWCGSAFlAwQCAQUAMIIBWAYLKoZIhvcNAQkQAQSg
# ggFHBIIBQzCCAT8CAQEGCisGAQQBhFkKAwEwMTANBglghkgBZQMEAgEFAAQgwTY9
# qLN1Ye8DiIsDTr8DCiyBTAM2WXI8PW552duUMKACBmHCHy8jcxgSMjAyMjAxMjEw
# ODQzNDUuOTRaMASAAgH0oIHYpIHVMIHSMQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRp
# b25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjhENDEtNEJGNy1C
# M0I3MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2aWNloIIRaDCC
# BxQwggT8oAMCAQICEzMAAAGILs3GgUHhvCoAAQAAAYgwDQYJKoZIhvcNAQELBQAw
# fDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1Jl
# ZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMd
# TWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjExMDI4MTkyNzQwWhcN
# MjMwMTI2MTkyNzQwWjCB0jELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0
# b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3Jh
# dGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0aW9ucyBMaW1p
# dGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjo4RDQxLTRCRjctQjNCNzElMCMG
# A1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCAiIwDQYJKoZIhvcN
# AQEBBQADggIPADCCAgoCggIBAJrnEAgEJpHFx8g61eEvPFXiYNlxqjSnFqbK2qUS
# hVnIYYy7H/zPVzfW4M5yzePAVzwLTpcKHnQdpDeG2XTz9ynUTW2KtbTRVIfFJ5ow
# gq/goy5a4oB3JktEfq7DdoATF5SxGYdlvwjrg/VTi7G9j9ow6eN91eK1AAFFvNjO
# 64PNXdznHLTvtV1tYdxLW0LUukBJMOg2CLr31+wMPI1x2Z7DLoD/GQNaLaa6UzVI
# f80Vguwicgc8pkCA0gnVoVXw+LIcXvkbOtWsX9u204OR/1f0pDXfYczOjav8tjow
# yqy7bjfYUud+evboUzUHgIQFQ33h6RM5TL7Vzsl+jE5nt45x3Rz4+hi0/QDESKwH
# /eoT2DojxAbx7a4OjKYiN/pejZW0jrNevxU3pY09frHbFhrRU2b3mvaQKldWge/e
# Wg5JmerEZuY7XZ1Ws36Fqx3d7w3od+VldPL1uE5TnxHFdvim2oqz8WhZCePrZbCf
# jH7FTok6/2Zw4GjGh5886IHpSNwKHw1PSE2zJE7U8ayz8oE20XbW6ba5y8wZ9o80
# eEyX5EKPoc1rmjLuTrTGYildiOTDtJtZirlAIKKvuONi8PAkLo/RAthfJ02yW9jX
# FA4Pu+HYCYrPz/AWvzq5cVvk64HOkzxsQjrU+9/VKnrJb1g+qzUOlBDvX+71g5IX
# dr7bAgMBAAGjggE2MIIBMjAdBgNVHQ4EFgQUZHm1UMSju867vfqNuxoz5YzJSkow
# HwYDVR0jBBgwFoAUn6cVXQBeYl2D9OXSZacbUzUZ6XIwXwYDVR0fBFgwVjBUoFKg
# UIZOaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9jcmwvTWljcm9zb2Z0
# JTIwVGltZS1TdGFtcCUyMFBDQSUyMDIwMTAoMSkuY3JsMGwGCCsGAQUFBwEBBGAw
# XjBcBggrBgEFBQcwAoZQaHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraW9wcy9j
# ZXJ0cy9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAxMCgxKS5jcnQw
# DAYDVR0TAQH/BAIwADATBgNVHSUEDDAKBggrBgEFBQcDCDANBgkqhkiG9w0BAQsF
# AAOCAgEAQBBa2/tYCCbL/xii0ts2r5tnpNe+5pOMrugbkulYiLi9HttGDdnXV3ol
# IRHYZNxUbaPxg/d5OUiMjSel/qfLkDDsSNt2DknchMyycIe/n7btCH/Mt8egCdEt
# Xddjme37GKpYx1HnHJ3kvQ1qoqR5PLjPJtmWwYUZ1DfDOIqoOK6CRpmSmfRXPGe2
# RyYDPe4u3yMgPYSR9Ne89uVqwyZcWqQ+XZjMjcs83wFamgcnpgqAZ+FZEQhjSEsd
# MUZXG/d1uhDYSRdTQYzJd3ClRB1uHfGNDWYaXVw7Xi5PR4GycngiNnzfRgawktQd
# WpPtfeDxomSi/PoLSuzaKwKADELxZGIKx61gmH41ej6LgtzfgOsDga3JFTh0/T1C
# AyuQAwh+Ga2kInXkvSw/4pihzNyOImsz5KHB3BRwfcqOXfZTCWfqZwAFoJUEIzFo
# VKpxP5ZQPhKo2ztJQMZZlLVYqFVLMIU96Sug4xUVzPy1McE7bbn89cwYxC5ESGfL
# gstWJDMXwRcBKLP0BSJQ2hUr1J+CIlmQN1S3wBI8udYicCto0iB8PtW4wiPhQR3A
# k0R9qT9/oeQ5UOQGf3b3HzawEz9cMM9uSK/CoCjmx0QiGB+FSNla5jm6EhxRu/SW
# x3ZD1Uo3y8U7k7KIeRc6FNbebqxtK8LpaGWRWcU5K8X8k5Ib5owwggdxMIIFWaAD
# AgECAhMzAAAAFcXna54Cm0mZAAAAAAAVMA0GCSqGSIb3DQEBCwUAMIGIMQswCQYD
# VQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEe
# MBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMTIwMAYDVQQDEylNaWNyb3Nv
# ZnQgUm9vdCBDZXJ0aWZpY2F0ZSBBdXRob3JpdHkgMjAxMDAeFw0yMTA5MzAxODIy
# MjVaFw0zMDA5MzAxODMyMjVaMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEA5OGmTOe0ciELeaLL1yR5
# vQ7VgtP97pwHB9KpbE51yMo1V/YBf2xK4OK9uT4XYDP/XE/HZveVU3Fa4n5KWv64
# NmeFRiMMtY0Tz3cywBAY6GB9alKDRLemjkZrBxTzxXb1hlDcwUTIcVxRMTegCjhu
# je3XD9gmU3w5YQJ6xKr9cmmvHaus9ja+NSZk2pg7uhp7M62AW36MEBydUv626GIl
# 3GoPz130/o5Tz9bshVZN7928jaTjkY+yOSxRnOlwaQ3KNi1wjjHINSi947SHJMPg
# yY9+tVSP3PoFVZhtaDuaRr3tpK56KTesy+uDRedGbsoy1cCGMFxPLOJiss254o2I
# 5JasAUq7vnGpF1tnYN74kpEeHT39IM9zfUGaRnXNxF803RKJ1v2lIH1+/NmeRd+2
# ci/bfV+AutuqfjbsNkz2K26oElHovwUDo9Fzpk03dJQcNIIP8BDyt0cY7afomXw/
# TNuvXsLz1dhzPUNOwTM5TI4CvEJoLhDqhFFG4tG9ahhaYQFzymeiXtcodgLiMxhy
# 16cg8ML6EgrXY28MyTZki1ugpoMhXV8wdJGUlNi5UPkLiWHzNgY1GIRH29wb0f2y
# 1BzFa/ZcUlFdEtsluq9QBXpsxREdcu+N+VLEhReTwDwV2xo3xwgVGD94q0W29R6H
# XtqPnhZyacaue7e3PmriLq0CAwEAAaOCAd0wggHZMBIGCSsGAQQBgjcVAQQFAgMB
# AAEwIwYJKwYBBAGCNxUCBBYEFCqnUv5kxJq+gpE8RjUpzxD/LwTuMB0GA1UdDgQW
# BBSfpxVdAF5iXYP05dJlpxtTNRnpcjBcBgNVHSAEVTBTMFEGDCsGAQQBgjdMg30B
# ATBBMD8GCCsGAQUFBwIBFjNodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpb3Bz
# L0RvY3MvUmVwb3NpdG9yeS5odG0wEwYDVR0lBAwwCgYIKwYBBQUHAwgwGQYJKwYB
# BAGCNxQCBAweCgBTAHUAYgBDAEEwCwYDVR0PBAQDAgGGMA8GA1UdEwEB/wQFMAMB
# Af8wHwYDVR0jBBgwFoAU1fZWy4/oolxiaNE9lJBb186aGMQwVgYDVR0fBE8wTTBL
# oEmgR4ZFaHR0cDovL2NybC5taWNyb3NvZnQuY29tL3BraS9jcmwvcHJvZHVjdHMv
# TWljUm9vQ2VyQXV0XzIwMTAtMDYtMjMuY3JsMFoGCCsGAQUFBwEBBE4wTDBKBggr
# BgEFBQcwAoY+aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL3BraS9jZXJ0cy9NaWNS
# b29DZXJBdXRfMjAxMC0wNi0yMy5jcnQwDQYJKoZIhvcNAQELBQADggIBAJ1Vffwq
# reEsH2cBMSRb4Z5yS/ypb+pcFLY+TkdkeLEGk5c9MTO1OdfCcTY/2mRsfNB1OW27
# DzHkwo/7bNGhlBgi7ulmZzpTTd2YurYeeNg2LpypglYAA7AFvonoaeC6Ce5732pv
# vinLbtg/SHUB2RjebYIM9W0jVOR4U3UkV7ndn/OOPcbzaN9l9qRWqveVtihVJ9Ak
# vUCgvxm2EhIRXT0n4ECWOKz3+SmJw7wXsFSFQrP8DJ6LGYnn8AtqgcKBGUIZUnWK
# NsIdw2FzLixre24/LAl4FOmRsqlb30mjdAy87JGA0j3mSj5mO0+7hvoyGtmW9I/2
# kQH2zsZ0/fZMcm8Qq3UwxTSwethQ/gpY3UA8x1RtnWN0SCyxTkctwRQEcb9k+SS+
# c23Kjgm9swFXSVRk2XPXfx5bRAGOWhmRaw2fpCjcZxkoJLo4S5pu+yFUa2pFEUep
# 8beuyOiJXk+d0tBMdrVXVAmxaQFEfnyhYWxz/gq77EFmPWn9y8FBSX5+k77L+Dvk
# txW/tM4+pTFRhLy/AsGConsXHRWJjXD+57XQKBqJC4822rpM+Zv/Cuk0+CQ1Zyvg
# DbjmjJnW4SLq8CdCPSWU5nR0W2rRnj7tfqAxM328y+l7vzhwRNGQ8cirOoo6CGJ/
# 2XBjU02N7oJtpQUQwXEGahC0HVUzWLOhcGbyoYIC1zCCAkACAQEwggEAoYHYpIHV
# MIHSMQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQL
# EyRNaWNyb3NvZnQgSXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsT
# HVRoYWxlcyBUU1MgRVNOOjhENDEtNEJGNy1CM0I3MSUwIwYDVQQDExxNaWNyb3Nv
# ZnQgVGltZS1TdGFtcCBTZXJ2aWNloiMKAQEwBwYFKw4DAhoDFQDhPIrMfCAXlT0s
# Hg/NOZeUHXoOQqCBgzCBgKR+MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNo
# aW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29y
# cG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEw
# MA0GCSqGSIb3DQEBBQUAAgUA5ZTScTAiGA8yMDIyMDEyMTE0MzQyNVoYDzIwMjIw
# MTIyMTQzNDI1WjB3MD0GCisGAQQBhFkKBAExLzAtMAoCBQDllNJxAgEAMAoCAQAC
# AgFiAgH/MAcCAQACAiEIMAoCBQDlliPxAgEAMDYGCisGAQQBhFkKBAIxKDAmMAwG
# CisGAQQBhFkKAwKgCjAIAgEAAgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEF
# BQADgYEASBoGpp39i0eV9QHaBHBzjHRTXp525eKfb53QoJ1kwKg4+T30hXodTy0s
# rrQ1echUkKGHaCWSREcogp5m4UnIoUmY+xcvMfdgIcyx3tT1MVifkFIAOqprwd0c
# +K50/dIosqG6cUw+qx/x7VYfcEzbv1EdkxiVn4MoI13kHwu6hL8xggQNMIIECQIB
# ATCBkzB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UE
# BxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYD
# VQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAYguzcaBQeG8
# KgABAAABiDANBglghkgBZQMEAgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3
# DQEJEAEEMC8GCSqGSIb3DQEJBDEiBCD7DMWpJC/dZjEdxuWqiIaMA8/z7njC4ocM
# h9u4ig2fRjCB+gYLKoZIhvcNAQkQAi8xgeowgecwgeQwgb0EIGbp3u2sBjdGhIL4
# z+ycjtzSpe4bLV/AoYaypl7SSUClMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3Rh
# bXAgUENBIDIwMTACEzMAAAGILs3GgUHhvCoAAQAAAYgwIgQgB43wbEmZyjVjJvo9
# Phx3Z3RzmEMt0rW03M61tkOHvLkwDQYJKoZIhvcNAQELBQAEggIAhAaH4FnNHJTj
# Ts1mZMt/zZbs232QAc+9EuxPFBAaS03Nmsmy+8yq0lwgw0/hZkOhaa6bz7I72/QS
# VDNKiYfh5h2WFUiScb3E5XCquJsJfh47QVh56KM3frp+WORFTKTLYhVe5F0qdVrk
# GeUfx5uVPkb89OAZCtqSkAlzwZweR/2lyedRD8Yyw5zBLegR26rvfzlU8jRcnxxk
# gqllD7cKsCu8Y+C+I+MHf4Ssh6OgtbYCqsLCNCwLfIxjNtTqUqCrhllczdlBrdlm
# SQZpzCPoI7+MVXRSUrXBEsBYEVkSx0i2jEROcftWUHmNmvY4X0oD6Qb6S6YZNzS3
# Sx1X5r1wD0DRtTemBnroffkIaQOh2v2+PdUfPCvf4fWvq1cqhi7F3exM0hOu1NoK
# zyGJ+N/YP8UfsrbwmtVnOaOel4h9JdnOCiCD86m2FIo0h0IesylQQ6peG4l7Wnzw
# i1m3qDN4Np/9hS9U9o7eunqOYqaFEOFw1b3TrwyzcBvTs6T7s4Nb6/s0ZO/nrBVc
# RFPHDLqJPBTyNI9qLpBmRUi7Oqm2hhKhT6alJRZJXkLUISNyAMIl1NoPWfo2wRyw
# atxblZ+K2v3ExQ/Vo1R8R9kVFac4oChv0RPz4yrwDfApL2YsmDpOQ7UfoQIn0txU
# 0033SI8sUwPAYGwjrReqkrkmO0+i7wc=
# SIG # End signature block