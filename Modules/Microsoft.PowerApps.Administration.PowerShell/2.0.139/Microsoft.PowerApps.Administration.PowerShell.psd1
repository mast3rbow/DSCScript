@{

# Script module or binary module file associated with this manifest.
RootModule = 'Microsoft.PowerApps.Administration.Powershell.psm1'

# Version number of this module.
ModuleVersion = '2.0.139'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '1c40b0da-ee6a-4226-9a3d-e60092e1daae'

# Author of this module
Author = 'Microsoft Common Data Service Team'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '© 2020 Microsoft Corporation. All rights reserved'

# Description of the functionality provided by this module
Description = 'PowerShell interface for Microsoft PowerApps and Flow Administrative features'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '3.0'

# Name of the Windows PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the Windows PowerShell host required by this module
PowerShellHostVersion = '1.0'

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.0.0.0'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
#RequiredModules = @(@{ModuleName = "Microsoft.PowerApps.RestClientModule"; ModuleVersion = "1.0"; Guid = "04800678-e13e-4b41-8d46-424e707ea733"})
#RequiredModules = @(@{ModuleName = "Microsoft.PowerApps.RestClientModule"; ModuleVersion = "1.0"; Guid = "04800678-e13e-4b41-8d46-424e707ea733"})

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
#NestedModules = @('Microsoft.PowerApps.AuthModule', 'Microsoft.PowerApps.RestClientModule')

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @(
    'New-AdminPowerAppCdsDatabase', `
    'Get-AdminPowerAppCdsDatabaseLanguages', `
    'Get-AdminPowerAppCdsDatabaseCurrencies', `
    'Get-AdminPowerAppEnvironmentLocations', `
    'Get-AdminPowerAppCdsDatabaseTemplates', `
    'New-AdminPowerAppEnvironment', `
    'Set-AdminPowerAppEnvironmentDisplayName', `
    'Set-AdminPowerAppEnvironmentRuntimeState', `
    'Get-AdminPowerAppEnvironment', `
    'Get-AdminPowerAppSoftDeletedEnvironment', `
    'Get-AdminPowerAppOperationStatus', `
    'Remove-AdminPowerAppEnvironment', `
    'Recover-AdminPowerAppEnvironment', `
    'Reset-PowerAppEnvironment', `
    'Get-AdminPowerAppEnvironmentRoleAssignment', `
    'Set-AdminPowerAppEnvironmentRoleAssignment', `
    'Remove-AdminPowerAppEnvironmentRoleAssignment', `
    'Get-AdminPowerApp', `
    'Remove-AdminPowerApp', `
    'Get-AdminPowerAppRoleAssignment', `
    'Remove-AdminPowerAppRoleAssignment', `
    'Set-AdminPowerAppRoleAssignment', `
    'Set-AdminPowerAppOwner', `
    'Get-AdminFlow', `
    'Add-PowerAppsCustomBrandingAssets', `
    'Enable-AdminFlow', `
    'Disable-AdminFlow', `
    'Remove-AdminFlow', `
    'Remove-AdminFlowApprovals', `
    'Set-AdminFlowOwnerRole', `
    'Remove-AdminFlowOwnerRole', `
    'Get-AdminFlowOwnerRole', `
    'Get-AdminPowerAppConnector', `
    'Get-AdminPowerAppConnectorAction', `
    'Get-AdminPowerAppConnectorRoleAssignment', `
    'Set-AdminPowerAppConnectorRoleAssignment', `
    'Remove-AdminPowerAppConnectorRoleAssignment', `
    'Remove-AdminPowerAppConnector', `
    'Get-AdminPowerAppConnection', `
    'Remove-AdminPowerAppConnection', `
    'Get-AdminPowerAppConnectionRoleAssignment', `
    'Set-AdminPowerAppConnectionRoleAssignment', `
    'Remove-AdminPowerAppConnectionRoleAssignment', `
    'Get-AdminPowerAppsUserDetails', `
    'Get-AdminFlowUserDetails', `
    'Remove-AdminFlowUserDetails', `
    'Set-AdminPowerAppAsFeatured', `
    'Clear-AdminPowerAppAsFeatured', `
    'Set-AdminPowerAppAsHero', `
    'Clear-AdminPowerAppAsHero', `
    'Set-AppAsUnquarantined', `
    'Set-AppAsQuarantined', `
	'Get-AppQuarantineState', `
    'Set-AdminPowerAppApisToBypassConsent', `
    'Clear-AdminPowerAppApisToBypassConsent', `
    'Get-AdminPowerAppConditionalAccessAuthenticationContextIds', `
    'Set-AdminPowerAppConditionalAccessAuthenticationContextIds', `
    'Remove-AdminPowerAppConditionalAccessAuthenticationContextIds', `
    'Get-AdminDlpPolicy', `
    'New-AdminDlpPolicy', `
    'Remove-AdminDlpPolicy', `
    'Set-AdminDlpPolicy', `
    'Add-ConnectorToBusinessDataGroup', `
    'Remove-ConnectorFromBusinessDataGroup', `
    'Get-AdminPowerAppConnectionReferences', `
    'Add-CustomConnectorToPolicy', `
    'Remove-CustomConnectorFromPolicy', `
    'Remove-LegacyCDSDatabase', `
    'Get-AdminDeletedPowerAppsList', `
    'Get-AdminRecoverDeletedPowerApp', `
    #from Rest and Auth Module Helpers
    'Select-CurrentEnvironment', `
    'Add-PowerAppsAccount', `
    'Remove-PowerAppsAccount',`
    'Test-PowerAppsAccount', `
    'Get-TenantDetailsFromGraph', `
    'Get-UsersOrGroupsFromGraph', `
    'Get-JwtToken', `
    'ReplaceMacro', `
    'Set-TenantSettings', `
    'Get-TenantSettings', `
    'Get-AdminPowerAppTenantConsumedQuota', `
    'InvokeApi', `
    'InvokeApiNoParseContent', `
    'Add-AdminPowerAppsSyncUser', `
    'Remove-AllowedConsentPlans', `
    'Add-AllowedConsentPlans', `
    'Get-AllowedConsentPlans', `
    'Get-AdminPowerAppCdsAdditionalNotificationEmails', `
    'Set-AdminPowerAppCdsAdditionalNotificationEmails', `
    'Get-AdminPowerAppLicenses', `
    'Set-AdminPowerAppDesiredLogicalName' `
    # DLP policy Version 1 APIs
    'Get-DlpPolicy', `
    'New-DlpPolicy', `
    'Remove-DlpPolicy', `
    'Set-DlpPolicy', `
    # URL patterns Version 1 APIs
    'Get-PowerAppTenantUrlPatterns', `
    'New-PowerAppTenantUrlPatterns', `
    'Remove-PowerAppTenantUrlPatterns', `
    'Get-PowerAppPolicyUrlPatterns', `
    'New-PowerAppPolicyUrlPatterns', `
    'Remove-PowerAppPolicyUrlPatterns', `
    # Dlp policy connector configurations Version 1 APIs
    'Get-PowerAppDlpPolicyConnectorConfigurations', `
    'New-PowerAppDlpPolicyConnectorConfigurations', `
    'Remove-PowerAppDlpPolicyConnectorConfigurations', `
    'Set-PowerAppDlpPolicyConnectorConfigurations', `
    # Copy/Backup/Restore APIs
    'Copy-PowerAppEnvironment', `
    'Backup-PowerAppEnvironment', `
    'Get-PowerAppEnvironmentBackups', `
    'Restore-PowerAppEnvironment', `
    'Remove-PowerAppEnvironmentBackup', `
    # ManagementApp APIs
    'Get-PowerAppManagementApp', `
    'Get-PowerAppManagementApps', `
    'New-PowerAppManagementApp', `
    'Remove-PowerAppManagementApp', `
    # Environment Keywords
    'Get-AdminPowerAppSharepointFormEnvironment', `
    'Set-AdminPowerAppSharepointFormEnvironment', `
    'Reset-AdminPowerAppSharepointFormEnvironment', `
    # Protection key APIs
    'Get-PowerAppGenerateProtectionKey', `
    'Get-PowerAppRetrieveTenantProtectionKey', `
    'Get-PowerAppRetrieveAvailableTenantProtectionKeys', `
    'New-PowerAppImportProtectionKey', `
    'Set-PowerAppProtectionStatus', `
    'Set-PowerAppTenantProtectionKey', `
    'Set-PowerAppLockAllEnvironments', `
    'Set-PowerAppUnlockEnvironment', `
    # Tenant isolation APIs
    'Get-PowerAppTenantIsolationPolicy', `
    'Set-PowerAppTenantIsolationPolicy', `
    'Get-PowerAppTenantIsolationOperationStatus', `
	# Dlp Error Settings APIs
	'Get-PowerAppDlpErrorSettings', `
	'New-PowerAppDlpErrorSettings', `
	'Set-PowerAppDlpErrorSettings', `
	'Remove-PowerAppDlpErrorSettings', `
    # Dlp policy exempt resources Version 1 APIs
	'Get-PowerAppDlpPolicyExemptResources', `
	'New-PowerAppDlpPolicyExemptResources', `
	'Remove-PowerAppDlpPolicyExemptResources', `
	'Set-PowerAppDlpPolicyExemptResources', `
	# virtual connector Route
	'Get-AdminVirtualConnectors', `
    # Dlp Connector blocking APIs
    'Get-PowerAppDlpConnectorBlockingPolicies', `
    'Get-PowerAppDlpConnectorBlockingPolicy', `
    'New-PowerAppDlpConnectorBlockingPolicy', `
    'Set-PowerAppDlpConnectorBlockingPolicy', `
    'Remove-PowerAppDlpConnectorBlockingPolicy'

)

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
# CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
# AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
ModuleList = @("Microsoft.PowerApps.Administration.PowerShell" )

# List of all files packaged with this module
# When included they are automatically loaded which can pull the files by name from uncontrolled locations.
FileList = @(
    "Microsoft.PowerApps.Administration.PowerShell.psm1", `
    "Microsoft.PowerApps.Administration.PowerShell.psd1", `
    "Microsoft.PowerApps.AuthModule.psm1", `
    "Microsoft.PowerApps.RestClientModule.psm1"
)

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
         LicenseUri = 'https://aka.ms/powerappspowershellprereleaseterms'

        # A URL to the main website for this project.
         ProjectUri = 'https://docs.microsoft.com/en-us/powerapps/administrator/powerapps-powershell'

        # A URL to an icon representing this module.
         IconUri = 'https://connectoricons-prod.azureedge.net/powerplatformforadmins/icon_1.0.1056.1255.png'

        # ReleaseNotes of this module
        ReleaseNotes = '

Current Release:
2.0.139
    Added new Apis for Connector blocking Policy
        Get-PowerAppDlpConnectorBlockingPolicies,
        Get-PowerAppDlpConnectorBlockingPolicy,
        New-PowerAppDlpConnectorBlockingPolicy,
        Set-PowerAppDlpConnectorBlockingPolicy,
        Remove-PowerAppDlpConnectorBlockingPolicy

2.0.113
    Add Set-AdminPowerAppDesiredLogicalName to enable setting desired logical name for non-solution aware canvas apps

2.0.112
    Add virtual connector call
    Get-AdminVirtualConnectors

2.0.111:
    Added new APIS for DLP Policy Exempt Resources APIs
        Get-PowerAppDlpPolicyExemptResources,
        New-PowerAppDlpPolicyExemptResources,
        Remove-PowerAppDlpPolicyExemptResources,
        Set-PowerAppDlpPolicyExemptResources    

2.0.110:
    Add Teams environment in New-AdminPowerAppEnvironment and add EnvironmentSku filter in Get-AdminPowerAppEnvironment
    
2.0.109:
    Add support for AzureRegion selection in New-AdminPowerAppEnvironment
    Added new APIs for error settings DLP:
        Get-PowerAppDlpErrorSettings,
        New-PowerAppDlpErrorSettings,
        Set-PowerAppDlpErrorSettings,
        Remove-PowerAppDlpErrorSettings

2.0.101:
    Revert "Add-CustomConnectorToPolicy is limited to only work for environment-level policies"

2.0.100:
    Add-CustomConnectorToPolicy is limited to only work for environment-level policies

2.0.96:
    Add tenant isolation APIs
    Skip triggers in Get-AdminPowerAppConnectorAction

2.0.92:
    Fix polling behavior on failures for environment lifecycle operations

2.0.86:
    Add Get-AdminPowerAppConnectorAction API

2.0.81:
    Add new DLP Policy Connector Configurations APIs:
        Get-PowerAppDlpPolicyConnectorConfigurations,
        New-PowerAppDlpPolicyConnectorConfigurations,
        Remove-PowerAppDlpPolicyConnectorConfigurations,
        Set-PowerAppDlpPolicyConnectorConfigurations

2.0.77:
    Add ProtectionKey APIs:
        Get-PowerAppGenerateProtectionKey,
        Get-PowerAppRetrieveTenantProtectionKey,
        Get-PowerAppRetrieveAvailableTenantProtectionKeys,
        New-PowerAppImportProtectionKey,
        Set-PowerAppProtectionStatus,
        Set-PowerAppTenantProtectionKey,
        Set-PowerAppLockAllEnvironments,
        Set-PowerAppUnlockEnvironment

2.0.76:
    Add Get-AdminPowerAppTenantConsumedQuota API and GetProtectedEnvironment parameter for Get-AdminPowerAppEnvironment

2.0.75:
    Add ManagementApp APIs:
        Get-PowerAppManagementApp,
        Get-PowerAppManagementApps,
        New-PowerAppManagementApp,
        Remove-PowerAppManagementApp

    Add Sharepoint Environment APIs:
        Get-AdminPowerAppSharepointFormEnvironment
        Set-AdminPowerAppSharepointFormEnvironment
        Reset-AdminPowerAppSharepointFormEnvironment

2.0.72:
    Fix bugs for SPN error handling

2.0.70:
    Add test automation support
    Added new APIs:
        Get-PowerAppTenantUrlPatterns,
        New-PowerAppTenantUrlPatterns,
        Remove-PowerAppTenantUrlPatterns,
        Get-PowerAppPolicyUrlPatterns,
        New-PowerAppPolicyUrlPatterns,
        Remove-PowerAppPolicyUrlPatterns

2.0.67:
    Add Set-AdminPowerAppEnvironmentRuntimeState API

2.0.66:
    Add SubscriptionBasedTrial SKU support.

2.0.65:
    Add Get-AdminPowerAppOperationStatus API for async scenario support.

2.0.64:
    Added new APIs:
        Copy-PowerAppEnvironment,
        Backup-PowerAppEnvironment,
        Get-PowerAppEnvironmentBackups,
        Restore-PowerAppEnvironment,
        Remove-PowerAppEnvironmentBackup,
        Reset-PowerAppEnvironment

2.0.63:
    Added DoD support. Fix bug PowerShell Cmdlet "Set-AdminPowerAppRoleAssignment" is broken when setting the tenant sharing.

2.0.61:
    BREAKING CHANGE: Changed return value to environment object when New-AdminPowerAppEnvironment CDS provision completed.
    Fixed empty return error bug (error code and error message will be returned when API fails).

2.0.60:
    Add TimeoutInMinutes parameter in New-AdminPowerAppEnvironment to make timeout configurable.
    BREAKING CHANGE: The default timeout is changed to a week (waiting for server timeout).
    Fixed "Cannot bind argument to parameter ''Route'' because it is an empty string" exception for New-AdminPowerAppEnvironment.

2.0.59:
    Fixed removing connector from policy that had been added with an invalid connector ID.

2.0.57:
    Fixed pagination problem for Get-DlpPolicy, Get-AdminFlow, and Get-AdminPowerApp.

2.0.56:
    Fixed duplicate key error for ConvertFrom-Json with case-invariant comparison.

2.0.53:
    Added early Public Preview release of DLP (Data Loss Prevention) v2 PowerShell cmdlets

2.0.52:
    Introduced new cmdlets for admins to list and recover deleted Power Apps

2.0.45:
    Fixed missing Example sections for some incorrectly formatted cmdlet headers

2.0.44:
    Added a cmdlet to download a manifest of all user''s Power Apps licenses for a tenant

2.0.42:
    Fixed cmdlet deadlock issue when long-running operations reached a timeout condition

2.0.40:
    Fixed set of codes to wait for when long-running operations were checking for status
    Fixed an incorrect error message when creating a CDS database environment failed
    Fixed defective ability to associate new DLP policies with specific environments

2.0.37:
    Fixed bug when deserializing "Common Data Service for Apps" environment information
    Introduced new cmdlets for admins to get and set additional notification emails

2.0.34:
    Added logic to skip filtered flows that could not be deserialized instead of failing
    Fixed bug that prevented paging from working properly when getting all flows as admin

2.0.33:
    Enabled creation of new environments as type Sandbox [addition to Trial and Production]

2.0.31:
    Introduced new cmdlets for admins to list and recover soft-deleted environments

2.0.27:
    Revamp cmdlets to block and allow consent plans in response to breaking service change

2.0.26:
    Fixed a handful of bugs related to parameters to create new CDS database environments

2.0.19:
    Introduced new cmdlet to get all CDS database templates so all inputs are retrievable

2.0.15:
    Introduced new cmdlet to sync licensed and authorized AAD tenant user into environment
    Fixed bugs in limited Private Preview cmdlets for DLP v1 connector Blocking [obsolete]
    Added limited Private Preview cmdlets for DLP v1 connector Blocking [obsolete]

2.0.12:
    Introduced new cmdlets to block and allow consent plans in tenant

2.0.6:
    Added support for the Verbose flag to extend to internal calls'
    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = 'PowerApp'

}

# SIG # Begin signature block
# MIIjkQYJKoZIhvcNAQcCoIIjgjCCI34CAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCD/fCpuyunmxqym
# TjsjhDaQ9Ghy0ol8w2GranUIwZRr3qCCDYEwggX/MIID56ADAgECAhMzAAAB32vw
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
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIVZjCCFWICAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAd9r8C6Sp0q00AAAAAAB3zAN
# BglghkgBZQMEAgEFAKCBoDAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgQQ24w+tf
# 1noSQP2V4SDla0+jbuBOBVAF2iLQypLqKbMwNAYKKwYBBAGCNwIBDDEmMCSgEoAQ
# AFQAZQBzAHQAUwBpAGcAbqEOgAxodHRwOi8vdGVzdCAwDQYJKoZIhvcNAQEBBQAE
# ggEAP2yHojVAChotlqd+yaHZucGp6qROMJjDVHXw45JSA+TSwszvis5cRhFqcxO8
# Eaeilg+ELVuGvjx4+/V9NhyoPPmjIxc9f5RKV41R0C4qTRGBx/QYouEhmQGTRI/H
# wpleXd5AkSvKtHhx/SIf+uOLiir40W9EzLkFTG/kGXEop6/JDqULSCsMQNv0zKxF
# qqFpvrydWUplNRwaM1LsYaOLXq+Cci9VbHX5os4nG+3Gx36hr0VzkQnZopr5P4BV
# t2pWFAVBtqvlApXPltJvUi/0hPvB9TGoH63Jw4czF0mfcyeBfmWkWFwnKKZwfeEc
# z0cIhlb9ZgVC19CaXE3+9syoVKGCEv4wghL6BgorBgEEAYI3AwMBMYIS6jCCEuYG
# CSqGSIb3DQEHAqCCEtcwghLTAgEDMQ8wDQYJYIZIAWUDBAIBBQAwggFZBgsqhkiG
# 9w0BCRABBKCCAUgEggFEMIIBQAIBAQYKKwYBBAGEWQoDATAxMA0GCWCGSAFlAwQC
# AQUABCAoBtbjzCx888DfQ5dImscVCID6ykNwS2tV2Mlh6S8dowIGYXoBdNBUGBMy
# MDIxMTEwMjE2MTYxNi40MThaMASAAgH0oIHYpIHVMIHSMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFu
# ZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjE3
# OUUtNEJCMC04MjQ2MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2
# aWNloIIOTTCCBPkwggPhoAMCAQICEzMAAAE8i/25sz9Hl/0AAAAAATwwDQYJKoZI
# hvcNAQELBQAwfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAO
# BgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEm
# MCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwHhcNMjAxMDE1
# MTcyODIzWhcNMjIwMTEyMTcyODIzWjCB0jELMAkGA1UEBhMCVVMxEzARBgNVBAgT
# Cldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29m
# dCBDb3Jwb3JhdGlvbjEtMCsGA1UECxMkTWljcm9zb2Z0IElyZWxhbmQgT3BlcmF0
# aW9ucyBMaW1pdGVkMSYwJAYDVQQLEx1UaGFsZXMgVFNTIEVTTjoxNzlFLTRCQjAt
# ODI0NjElMCMGA1UEAxMcTWljcm9zb2Z0IFRpbWUtU3RhbXAgU2VydmljZTCCASIw
# DQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJgQKulpA6r2OQ4GkLfjl9DQi86l
# GorycR76Oiklz/lc02rNqermGt33CJvhF2+m4+PryfkOb9dm7a8KqdajGHLeLGtu
# BL+uDcJLduqnwCDVRCD/EDPfZO555M5jVw56VxdFqGiwhyOWuuS/XcBpwVebgBtg
# wKBgzoHN1koBF5tzrMS/7hALLj7UBXxEdAcQ52iPjY4mlsVaUe9grNe4zUAfi+aN
# P2j98KraZYPsiDb8Kloh3aAcrpH5L3T2Irbu5WSNVqnb9JvgBM4sltpVD5fT6Fhs
# RwJ6x/3eD60BBe68Dx0frd2grkjnN1kIXlT/cOJt+XtkIWxTqSz6mHiMmtsCAwEA
# AaOCARswggEXMB0GA1UdDgQWBBThoWfiyhL6NrNhPyUY6hi/Jmc8RjAfBgNVHSME
# GDAWgBTVYzpcijGQ80N7fEYbxTNoWoVtVTBWBgNVHR8ETzBNMEugSaBHhkVodHRw
# Oi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNUaW1TdGFQ
# Q0FfMjAxMC0wNy0wMS5jcmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5o
# dHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtpL2NlcnRzL01pY1RpbVN0YVBDQV8y
# MDEwLTA3LTAxLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoGCCsGAQUFBwMI
# MA0GCSqGSIb3DQEBCwUAA4IBAQAy9xCMlN2XeW5IzMWpGTFGSUn4pZFRSUHcjYol
# VZvgafp5Z0lOJZ0LW7F6MXag9fRv5f1AiGLy7UBpXv3Z4SK3aVDOpWA+J/JNkYuP
# MrY6i7g+P8Xnw+naboe6kZ+40B6GWf6FK+8gTmCAScKK/2VWQAk4yUscXfwNs+/u
# nJazQvO/ayNnA8e92G1XyUG05iwTw3HOeVuzJzzS9GdF6qbwlArpnzEAPhJ5jx24
# UVeFyIRMbYTRuH783ebAafNcnMxtIoAqTMjDpjGp/7MfNY8WKb0MZnCZyGr7okEq
# 1vgQZPQQW1+oYKs48Pk7u4/BJ2PVqmBeqjsdy3HuFyzmqOnCMIIGcTCCBFmgAwIB
# AgIKYQmBKgAAAAAAAjANBgkqhkiG9w0BAQsFADCBiDELMAkGA1UEBhMCVVMxEzAR
# BgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1p
# Y3Jvc29mdCBDb3Jwb3JhdGlvbjEyMDAGA1UEAxMpTWljcm9zb2Z0IFJvb3QgQ2Vy
# dGlmaWNhdGUgQXV0aG9yaXR5IDIwMTAwHhcNMTAwNzAxMjEzNjU1WhcNMjUwNzAx
# MjE0NjU1WjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4G
# A1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYw
# JAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMDCCASIwDQYJKoZI
# hvcNAQEBBQADggEPADCCAQoCggEBAKkdDbx3EYo6IOz8E5f1+n9plGt0VBDVpQoA
# goX77XxoSyxfxcPlYcJ2tz5mK1vwFVMnBDEfQRsalR3OCROOfGEwWbEwRA/xYIiE
# VEMM1024OAizQt2TrNZzMFcmgqNFDdDq9UeBzb8kYDJYYEbyWEeGMoQedGFnkV+B
# VLHPk0ySwcSmXdFhE24oxhr5hoC732H8RsEnHSRnEnIaIYqvS2SJUGKxXf13Hz3w
# V3WsvYpCTUBR0Q+cBj5nf/VmwAOWRH7v0Ev9buWayrGo8noqCjHw2k4GkbaICDXo
# eByw6ZnNPOcvRLqn9NxkvaQBwSAJk3jN/LzAyURdXhacAQVPIk0CAwEAAaOCAeYw
# ggHiMBAGCSsGAQQBgjcVAQQDAgEAMB0GA1UdDgQWBBTVYzpcijGQ80N7fEYbxTNo
# WoVtVTAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNVHQ8EBAMCAYYwDwYD
# VR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo0T2UkFvXzpoYxDBW
# BgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29mdC5jb20vcGtpL2Ny
# bC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5jcmwwWgYIKwYBBQUH
# AQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20vcGtp
# L2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDCBoAYDVR0gAQH/BIGV
# MIGSMIGPBgkrBgEEAYI3LgMwgYEwPQYIKwYBBQUHAgEWMWh0dHA6Ly93d3cubWlj
# cm9zb2Z0LmNvbS9QS0kvZG9jcy9DUFMvZGVmYXVsdC5odG0wQAYIKwYBBQUHAgIw
# NB4yIB0ATABlAGcAYQBsAF8AUABvAGwAaQBjAHkAXwBTAHQAYQB0AGUAbQBlAG4A
# dAAuIB0wDQYJKoZIhvcNAQELBQADggIBAAfmiFEN4sbgmD+BcQM9naOhIW+z66bM
# 9TG+zwXiqf76V20ZMLPCxWbJat/15/B4vceoniXj+bzta1RXCCtRgkQS+7lTjMz0
# YBKKdsxAQEGb3FwX/1z5Xhc1mCRWS3TvQhDIr79/xn/yN31aPxzymXlKkVIArzgP
# F/UveYFl2am1a+THzvbKegBvSzBEJCI8z+0DpZaPWSm8tv0E4XCfMkon/VWvL/62
# 5Y4zu2JfmttXQOnxzplmkIz/amJ/3cVKC5Em4jnsGUpxY517IW3DnKOiPPp/fZZq
# kHimbdLhnPkd/DjYlPTGpQqWhqS9nhquBEKDuLWAmyI4ILUl5WTs9/S/fmNZJQ96
# LjlXdqJxqgaKD4kWumGnEcua2A5HmoDF0M2n0O99g/DhO3EJ3110mCIIYdqwUB5v
# vfHhAN/nMQekkzr3ZUd46PioSKv33nJ+YWtvd6mBy6cJrDm77MbL2IK0cs0d9LiF
# AR6A+xuJKlQ5slvayA1VmXqHczsI5pgt6o3gMy4SKfXAL1QnIffIrE7aKLixqduW
# sqdCosnPGUFN4Ib5KpqjEWYw07t0MkvfY3v1mYovG8chr1m1rtxEPJdQcdeh0sVV
# 42neV8HR3jDA/czmTfsNv11P6Z0eGTgvvM9YBS7vDaBQNdrvCScc1bN+NR4Iuto2
# 29Nfj950iEkSoYIC1zCCAkACAQEwggEAoYHYpIHVMIHSMQswCQYDVQQGEwJVUzET
# MBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMV
# TWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQgSXJlbGFu
# ZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1MgRVNOOjE3
# OUUtNEJCMC04MjQ2MSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFtcCBTZXJ2
# aWNloiMKAQEwBwYFKw4DAhoDFQAdS3R6Wd5o8ttrXop7rdFHcHrk5qCBgzCBgKR+
# MHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdS
# ZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMT
# HU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBDQSAyMDEwMA0GCSqGSIb3DQEBBQUAAgUA
# 5Su//DAiGA8yMDIxMTEwMjIxNDc0MFoYDzIwMjExMTAzMjE0NzQwWjB3MD0GCisG
# AQQBhFkKBAExLzAtMAoCBQDlK7/8AgEAMAoCAQACAgwUAgH/MAcCAQACAhE6MAoC
# BQDlLRF8AgEAMDYGCisGAQQBhFkKBAIxKDAmMAwGCisGAQQBhFkKAwKgCjAIAgEA
# AgMHoSChCjAIAgEAAgMBhqAwDQYJKoZIhvcNAQEFBQADgYEADjdQ65T1PyAAm+0w
# 5T9mvurPbmX4X4q/bBO/pDY8ojSP0ohJ1zakPTCJhs5R1viVJATy/K/KYxCG6pQI
# vvbI2qwzNdRdQWuNorfOZEFvJEvwVbZZE6c33HfVFXeEEzu2Fa/OOQ9nC5wYLD4b
# 8OmGg/FhoY2O2Jqrh/oDfKHSkdYxggMNMIIDCQIBATCBkzB8MQswCQYDVQQGEwJV
# UzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UE
# ChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGlt
# ZS1TdGFtcCBQQ0EgMjAxMAITMwAAATyL/bmzP0eX/QAAAAABPDANBglghkgBZQME
# AgEFAKCCAUowGgYJKoZIhvcNAQkDMQ0GCyqGSIb3DQEJEAEEMC8GCSqGSIb3DQEJ
# BDEiBCCGuKEkeQLzn55qcLdaeBC49mXI/rc5uAkOaXZmdOc2sjCB+gYLKoZIhvcN
# AQkQAi8xgeowgecwgeQwgb0EIKBJArpNJL/A5zqpt9R8Ea/tiGw98ZiFuBUhiuEm
# 6FpGMIGYMIGApH4wfDELMAkGA1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24x
# EDAOBgNVBAcTB1JlZG1vbmQxHjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlv
# bjEmMCQGA1UEAxMdTWljcm9zb2Z0IFRpbWUtU3RhbXAgUENBIDIwMTACEzMAAAE8
# i/25sz9Hl/0AAAAAATwwIgQgcT6DmldoN0EUs/QbvgTZdDN4kZHtP+jSkJf2c/lO
# VmowDQYJKoZIhvcNAQELBQAEggEAFjEqX/aPursD2UrKFHJqfFPqXGzn0pwhx6YD
# OaY++OVwWnLPhtrmM+ArTB/bt9iCbmG7YMK0iaI26TvM92VnzYsrTX48YY7at+sG
# QNSkM8rzwr+TBHKKjxdoy5PAe2Dipj/zQ/BGRDGCHQN28IHMJ8M+7Zk6ysMA/rcg
# YgRmm0eOt4pSrzm+SnyhePR3pFRhEqrNTSJ3p19Daam7isoyuiLr5n34hPejQJ2K
# u18xbNXp/0zFURn6jW0o+AQknu0jTLCQoe2HiJxZnE5veI2QR1hnxcbCPm+Ba8NH
# c554staw0qlOxN8SkSsxyDrGietdAoZikvc08j9xcNtIHoeUuw==
# SIG # End signature block
