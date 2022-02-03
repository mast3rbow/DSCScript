#
# Module manifest for module 'Microsoft.Graph.Users'
#
# Generated by: Microsoft Corporation
#
# Generated on: 1/20/2022
#

@{

# Script module or binary module file associated with this manifest.
RootModule = './Microsoft.Graph.Users.psm1'

# Version number of this module.
ModuleVersion = '1.9.2'

# Supported PSEditions
CompatiblePSEditions = 'Core', 'Desktop'

# ID used to uniquely identify this module
GUID = '8498b9d9-1b58-4183-9b8f-550477c4727d'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = 'Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Microsoft Graph PowerShell Cmdlets'

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '5.1'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
DotNetFrameworkVersion = '4.7.2'

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# ClrVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
RequiredModules = @(@{ModuleName = 'Microsoft.Graph.Authentication'; ModuleVersion = '1.9.2'; })

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = './bin/Microsoft.Graph.Users.private.dll'

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
FormatsToProcess = './Microsoft.Graph.Users.format.ps1xml'

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = 'Get-MgUser', 'Get-MgUserCreatedObject', 
               'Get-MgUserCreatedObjectByRef', 'Get-MgUserDirectReport', 
               'Get-MgUserDirectReportByRef', 'Get-MgUserExtension', 
               'Get-MgUserLicenseDetail', 'Get-MgUserManager', 
               'Get-MgUserManagerByRef', 'Get-MgUserMemberOf', 
               'Get-MgUserMemberOfByRef', 'Get-MgUserNotification', 
               'Get-MgUserOauth2PermissionGrant', 
               'Get-MgUserOauth2PermissionGrantByRef', 
               'Get-MgUserOutlookMasterCategory', 'Get-MgUserOutlookTask', 
               'Get-MgUserOutlookTaskAttachment', 'Get-MgUserOutlookTaskFolder', 
               'Get-MgUserOutlookTaskFolderMultiValueExtendedProperty', 
               'Get-MgUserOutlookTaskFolderSingleValueExtendedProperty', 
               'Get-MgUserOutlookTaskFolderTask', 
               'Get-MgUserOutlookTaskFolderTaskAttachment', 
               'Get-MgUserOutlookTaskFolderTaskMultiValueExtendedProperty', 
               'Get-MgUserOutlookTaskFolderTaskSingleValueExtendedProperty', 
               'Get-MgUserOutlookTaskGroup', 
               'Get-MgUserOutlookTaskGroupTaskFolder', 
               'Get-MgUserOutlookTaskGroupTaskFolderMultiValueExtendedProperty', 
               'Get-MgUserOutlookTaskGroupTaskFolderSingleValueExtendedProperty', 
               'Get-MgUserOutlookTaskGroupTaskFolderTask', 
               'Get-MgUserOutlookTaskGroupTaskFolderTaskAttachment', 
               'Get-MgUserOutlookTaskGroupTaskFolderTaskMultiValueExtendedProperty', 
               'Get-MgUserOutlookTaskGroupTaskFolderTaskSingleValueExtendedProperty', 
               'Get-MgUserOutlookTaskMultiValueExtendedProperty', 
               'Get-MgUserOutlookTaskSingleValueExtendedProperty', 
               'Get-MgUserOwnedDevice', 'Get-MgUserOwnedDeviceByRef', 
               'Get-MgUserOwnedObject', 'Get-MgUserOwnedObjectByRef', 
               'Get-MgUserPhoto', 'Get-MgUserPhotoContent', 
               'Get-MgUserRegisteredDevice', 'Get-MgUserRegisteredDeviceByRef', 
               'Get-MgUserSetting', 'Get-MgUserSettingItemInsight', 
               'Get-MgUserSettingRegionalAndLanguageSetting', 
               'Get-MgUserSettingShiftPreference', 'Get-MgUserTodoList', 
               'Get-MgUserTodoListExtension', 'Get-MgUserTodoListTask', 
               'Get-MgUserTodoListTaskExtension', 
               'Get-MgUserTodoListTaskLinkedResource', 
               'Get-MgUserTransitiveMemberOf', 'Get-MgUserTransitiveMemberOfByRef', 
               'Get-MgUserTransitiveReport', 'Get-MgUserTransitiveReportByRef', 
               'New-MgUser', 'New-MgUserCreatedObjectByRef', 
               'New-MgUserDirectReportByRef', 'New-MgUserExtension', 
               'New-MgUserMemberOfByRef', 'New-MgUserNotification', 
               'New-MgUserOauth2PermissionGrantByRef', 
               'New-MgUserOutlookMasterCategory', 'New-MgUserOutlookTask', 
               'New-MgUserOutlookTaskAttachment', 'New-MgUserOutlookTaskFolder', 
               'New-MgUserOutlookTaskFolderMultiValueExtendedProperty', 
               'New-MgUserOutlookTaskFolderSingleValueExtendedProperty', 
               'New-MgUserOutlookTaskFolderTask', 
               'New-MgUserOutlookTaskFolderTaskAttachment', 
               'New-MgUserOutlookTaskFolderTaskMultiValueExtendedProperty', 
               'New-MgUserOutlookTaskFolderTaskSingleValueExtendedProperty', 
               'New-MgUserOutlookTaskGroup', 
               'New-MgUserOutlookTaskGroupTaskFolder', 
               'New-MgUserOutlookTaskGroupTaskFolderMultiValueExtendedProperty', 
               'New-MgUserOutlookTaskGroupTaskFolderSingleValueExtendedProperty', 
               'New-MgUserOutlookTaskGroupTaskFolderTask', 
               'New-MgUserOutlookTaskGroupTaskFolderTaskAttachment', 
               'New-MgUserOutlookTaskGroupTaskFolderTaskMultiValueExtendedProperty', 
               'New-MgUserOutlookTaskGroupTaskFolderTaskSingleValueExtendedProperty', 
               'New-MgUserOutlookTaskMultiValueExtendedProperty', 
               'New-MgUserOutlookTaskSingleValueExtendedProperty', 
               'New-MgUserOwnedDeviceByRef', 'New-MgUserOwnedObjectByRef', 
               'New-MgUserPhoto', 'New-MgUserRegisteredDeviceByRef', 
               'New-MgUserTodoList', 'New-MgUserTodoListExtension', 
               'New-MgUserTodoListTask', 'New-MgUserTodoListTaskExtension', 
               'New-MgUserTodoListTaskLinkedResource', 
               'New-MgUserTransitiveMemberOfByRef', 
               'New-MgUserTransitiveReportByRef', 'Remove-MgUser', 
               'Remove-MgUserExtension', 'Remove-MgUserLicenseDetail', 
               'Remove-MgUserManagerByRef', 'Remove-MgUserNotification', 
               'Remove-MgUserOutlookMasterCategory', 'Remove-MgUserOutlookTask', 
               'Remove-MgUserOutlookTaskAttachment', 
               'Remove-MgUserOutlookTaskFolder', 
               'Remove-MgUserOutlookTaskFolderMultiValueExtendedProperty', 
               'Remove-MgUserOutlookTaskFolderSingleValueExtendedProperty', 
               'Remove-MgUserOutlookTaskFolderTask', 
               'Remove-MgUserOutlookTaskFolderTaskAttachment', 
               'Remove-MgUserOutlookTaskFolderTaskMultiValueExtendedProperty', 
               'Remove-MgUserOutlookTaskFolderTaskSingleValueExtendedProperty', 
               'Remove-MgUserOutlookTaskGroup', 
               'Remove-MgUserOutlookTaskGroupTaskFolder', 
               'Remove-MgUserOutlookTaskGroupTaskFolderMultiValueExtendedProperty', 
               'Remove-MgUserOutlookTaskGroupTaskFolderSingleValueExtendedProperty', 
               'Remove-MgUserOutlookTaskGroupTaskFolderTask', 
               'Remove-MgUserOutlookTaskGroupTaskFolderTaskAttachment', 
               'Remove-MgUserOutlookTaskGroupTaskFolderTaskMultiValueExtendedProperty', 
               'Remove-MgUserOutlookTaskGroupTaskFolderTaskSingleValueExtendedProperty', 
               'Remove-MgUserOutlookTaskMultiValueExtendedProperty', 
               'Remove-MgUserOutlookTaskSingleValueExtendedProperty', 
               'Remove-MgUserPhoto', 'Remove-MgUserSetting', 
               'Remove-MgUserSettingItemInsight', 
               'Remove-MgUserSettingRegionalAndLanguageSetting', 
               'Remove-MgUserSettingShiftPreference', 'Remove-MgUserTodoList', 
               'Remove-MgUserTodoListExtension', 'Remove-MgUserTodoListTask', 
               'Remove-MgUserTodoListTaskExtension', 
               'Remove-MgUserTodoListTaskLinkedResource', 'Set-MgUserManagerByRef', 
               'Set-MgUserPhotoContent', 'Update-MgUser', 'Update-MgUserExtension', 
               'Update-MgUserLicenseDetail', 'Update-MgUserNotification', 
               'Update-MgUserOutlookMasterCategory', 'Update-MgUserOutlookTask', 
               'Update-MgUserOutlookTaskAttachment', 
               'Update-MgUserOutlookTaskFolder', 
               'Update-MgUserOutlookTaskFolderMultiValueExtendedProperty', 
               'Update-MgUserOutlookTaskFolderSingleValueExtendedProperty', 
               'Update-MgUserOutlookTaskFolderTask', 
               'Update-MgUserOutlookTaskFolderTaskAttachment', 
               'Update-MgUserOutlookTaskFolderTaskMultiValueExtendedProperty', 
               'Update-MgUserOutlookTaskFolderTaskSingleValueExtendedProperty', 
               'Update-MgUserOutlookTaskGroup', 
               'Update-MgUserOutlookTaskGroupTaskFolder', 
               'Update-MgUserOutlookTaskGroupTaskFolderMultiValueExtendedProperty', 
               'Update-MgUserOutlookTaskGroupTaskFolderSingleValueExtendedProperty', 
               'Update-MgUserOutlookTaskGroupTaskFolderTask', 
               'Update-MgUserOutlookTaskGroupTaskFolderTaskAttachment', 
               'Update-MgUserOutlookTaskGroupTaskFolderTaskMultiValueExtendedProperty', 
               'Update-MgUserOutlookTaskGroupTaskFolderTaskSingleValueExtendedProperty', 
               'Update-MgUserOutlookTaskMultiValueExtendedProperty', 
               'Update-MgUserOutlookTaskSingleValueExtendedProperty', 
               'Update-MgUserPhoto', 'Update-MgUserSetting', 
               'Update-MgUserSettingItemInsight', 
               'Update-MgUserSettingRegionalAndLanguageSetting', 
               'Update-MgUserSettingShiftPreference', 'Update-MgUserTodoList', 
               'Update-MgUserTodoListExtension', 'Update-MgUserTodoListTask', 
               'Update-MgUserTodoListTaskExtension', 
               'Update-MgUserTodoListTaskLinkedResource'

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
# VariablesToExport = @()

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = 'Get-MgUserMember', 'Get-MgUserMemberByRef', 
               'Get-MgUserTransitiveMember', 'Get-MgUserTransitiveMemberByRef', 
               'New-MgUserMemberByRef', 'New-MgUserTransitiveMemberByRef'

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    #Profiles of this module
    Profiles =  @('v1.0','v1.0-beta')

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = 'Microsoft','Office365','Graph','PowerShell'

        # A URL to the license for this module.
        LicenseUri = 'https://aka.ms/devservicesagreement'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/microsoftgraph/msgraph-sdk-powershell'

        # A URL to an icon representing this module.
        IconUri = 'https://raw.githubusercontent.com/microsoftgraph/msgraph-sdk-powershell/master/documentation/images/graph_color256.png'

        # ReleaseNotes of this module
        ReleaseNotes = 'See https://aka.ms/GraphPowerShell-Release.'

        # Prerelease string of this module
        # Prerelease = ''

        # Flag to indicate whether the module requires explicit user acceptance for install/update/save
        # RequireLicenseAcceptance = $false

        # External dependent modules of this module
        # ExternalModuleDependencies = @()

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}
