@{
	NestedModules =  if ($PSEdition -eq 'Core')
	{
		'Core/PnP.PowerShell.dll'
	}
	else
	{
		'Framework/PnP.PowerShell.dll'
	}
	ModuleVersion = '1.9.0'
	Description = 'Microsoft 365 Patterns and Practices PowerShell Cmdlets'
	GUID = '0b0430ce-d799-4f3b-a565-f0dca1f31e17'
	Author = 'Microsoft 365 Patterns and Practices'
	CompanyName = 'Microsoft 365 Patterns and Practices'
	CompatiblePSEditions = @("Core","Desktop")
	PowerShellVersion = '5.1'
	DotNetFrameworkVersion = '4.6.1'
	ProcessorArchitecture = 'None'
	FunctionsToExport = '*'  
	CmdletsToExport = @("Add-PnPClientSidePageSection","Add-PnPClientSideText","Add-PnPClientSideWebPart","Copy-PnPFolder","Export-PnPClientSidePage","Export-PnPClientSidePageMapping","Get-PnPAADUser","Get-PnPAvailableClientSideComponents","Get-PnPClientSideComponent","Get-PnPClientSidePage","Get-PnPFlowEnvironment","Get-PnPMicrosoft365GroupMembers","Get-PnPMicrosoft365GroupOwners","Invoke-PnPSearchQuery","Move-PnPClientSideComponent","Remove-PnPClientSideComponent","Remove-PnPClientSidePage","Save-PnPClientSidePageConversionLog","Set-PnPClientSidePage","Set-PnPClientSideText","Set-PnPClientSideWebPart","Add-PnPAlert","Add-PnPApp","Add-PnPApplicationCustomizer","Add-PnPAzureADGroupMember","Add-PnPAzureADGroupOwner","Add-PnPContentType","Add-PnPContentTypesFromContentTypeHub","Add-PnPContentTypeToDocumentSet","Add-PnPContentTypeToList","Add-PnPCustomAction","Add-PnPDataRowsToSiteTemplate","Add-PnPDocumentSet","Add-PnPEventReceiver","Add-PnPField","Add-PnPFieldFromXml","Add-PnPFieldToContentType","Add-PnPFile","Add-PnPFileToSiteTemplate","Add-PnPFolder","Add-PnPGroupMember","Add-PnPHtmlPublishingPageLayout","Add-PnPHubSiteAssociation","Add-PnPHubToHubAssociation","Add-PnPIndexedProperty","Add-PnPJavaScriptBlock","Add-PnPJavaScriptLink","Add-PnPListFoldersToSiteTemplate","Add-PnPListItem","Add-PnPListItemComment","Add-PnPMasterPage","Add-PnPMicrosoft365GroupMember","Add-PnPMicrosoft365GroupOwner","Add-PnPMicrosoft365GroupToSite","Add-PnPNavigationNode","Add-PnPOrgAssetsLibrary","Add-PnPOrgNewsSite","Add-PnPPage","Add-PnPPageSection","Add-PnPPageTextPart","Add-PnPPageWebPart","Add-PnPPlannerBucket","Add-PnPPlannerRoster","Add-PnPPlannerRosterMember","Add-PnPPlannerTask","Add-PnPPublishingImageRendition","Add-PnPPublishingPage","Add-PnPPublishingPageLayout","Add-PnPRoleDefinition","Add-PnPSiteClassification","Add-PnPSiteCollectionAdmin","Add-PnPSiteCollectionAppCatalog","Add-PnPSiteDesign","Add-PnPSiteDesignFromWeb","Add-PnPSiteDesignTask","Add-PnPSiteScript","Add-PnPSiteScriptPackage","Add-PnPSiteTemplate","Add-PnPStoredCredential","Add-PnPTaxonomyField","Add-PnPTeamsChannel","Add-PnPTeamsTab","Add-PnPTeamsTeam","Add-PnPTeamsUser","Add-PnPTenantCdnOrigin","Add-PnPTenantSequence","Add-PnPTenantSequenceSite","Add-PnPTenantSequenceSubSite","Add-PnPTenantTheme","Add-PnPTermToTerm","Add-PnPView","Add-PnPWebhookSubscription","Add-PnPWebPartToWebPartPage","Add-PnPWebPartToWikiPage","Add-PnPWikiPage","Approve-PnPTenantServicePrincipalPermissionRequest","Clear-PnPAzureADGroupMember","Clear-PnPAzureADGroupOwner","Clear-PnPDefaultColumnValues","Clear-PnPListItemAsRecord","Clear-PnPMicrosoft365GroupMember","Clear-PnPMicrosoft365GroupOwner","Clear-PnPRecycleBinItem","Clear-PnPTenantAppCatalogUrl","Clear-PnPTenantRecycleBinItem","Connect-PnPOnline","Convert-PnPFolderToSiteTemplate","Convert-PnPSiteTemplate","Convert-PnPSiteTemplateToMarkdown","ConvertTo-PnPPage","Copy-ItemProxy","Copy-PnPFile","Copy-PnPList","Deny-PnPTenantServicePrincipalPermissionRequest","Disable-PnPFeature","Disable-PnPFlow","Disable-PnPPageScheduling","Disable-PnPSharingForNonOwnersOfSite","Disable-PnPSiteClassification","Disable-PnPTenantServicePrincipal","Disconnect-PnPOnline","Enable-PnPCommSite","Enable-PnPFeature","Enable-PnPFlow","Enable-PnPPageScheduling","Enable-PnPSiteClassification","Enable-PnPTenantServicePrincipal","Export-PnPFlow","Export-PnPListToSiteTemplate","Export-PnPPage","Export-PnPPageMapping","Export-PnPTaxonomy","Export-PnPTermGroupToXml","Export-PnPUserInfo","Export-PnPUserProfile","Find-PnPFile","Get-PnPAccessToken","Get-PnPAlert","Get-PnPApp","Get-PnPAppAuthAccessToken","Get-PnPAppErrors","Get-PnPAppInfo","Get-PnPApplicationCustomizer","Get-PnPAuditing","Get-PnPAuthenticationRealm","Get-PnPAvailableLanguage","Get-PnPAvailablePageComponents","Get-PnPAzureADApp","Get-PnPAzureADAppPermission","Get-PnPAzureADAppSitePermission","Get-PnPAzureADGroup","Get-PnPAzureADGroupMember","Get-PnPAzureADGroupOwner","Get-PnPAzureADUser","Get-PnPAzureCertificate","Get-PnPBrowserIdleSignout","Get-PnPBuiltInDesignPackageVisibility","Get-PnPBuiltInSiteTemplateSettings","Get-PnPChangeLog","Get-PnPConnection","Get-PnPContentType","Get-PnPContentTypePublishingHubUrl","Get-PnPContext","Get-PnPCustomAction","Get-PnPDefaultColumnValues","Get-PnPDeletedMicrosoft365Group","Get-PnPDiagnostics","Get-PnPDisableSpacesActivation","Get-PnPDocumentSetTemplate","Get-PnPEventReceiver","Get-PnPException","Get-PnPExternalUser","Get-PnPFeature","Get-PnPField","Get-PnPFile","Get-PnPFileVersion","Get-PnPFlow","Get-PnPFolder","Get-PnPFolderItem","Get-PnPFooter","Get-PnPGraphAccessToken","Get-PnPGraphSubscription","Get-PnPGroup","Get-PnPGroupMember","Get-PnPGroupPermissions","Get-PnPHideDefaultThemes","Get-PnPHomePage","Get-PnPHomeSite","Get-PnPHubSite","Get-PnPHubSiteChild","Get-PnPIndexedPropertyKeys","Get-PnPInPlaceRecordsManagement","Get-PnPIsSiteAliasAvailable","Get-PnPJavaScriptLink","Get-PnPKnowledgeHubSite","Get-PnPLabel","Get-PnPList","Get-PnPListInformationRightsManagement","Get-PnPListItem","Get-PnPListItemComment","Get-PnPListPermissions","Get-PnPListRecordDeclaration","Get-PnPMasterPage","Get-PnPMessageCenterAnnouncement","Get-PnPMicrosoft365Group","Get-PnPMicrosoft365GroupMember","Get-PnPMicrosoft365GroupOwner","Get-PnPNavigationNode","Get-PnPOffice365CurrentServiceStatus","Get-PnPOffice365HistoricalServiceStatus","Get-PnPOffice365ServiceMessage","Get-PnPOffice365Services","Get-PnPOrgAssetsLibrary","Get-PnPOrgNewsSite","Get-PnPPage","Get-PnPPageComponent","Get-PnPPlannerBucket","Get-PnPPlannerConfiguration","Get-PnPPlannerPlan","Get-PnPPlannerRosterMember","Get-PnPPlannerRosterPlan","Get-PnPPlannerTask","Get-PnPPlannerUserPolicy","Get-PnPPowerPlatformEnvironment","Get-PnPPowerShellTelemetryEnabled","Get-PnPProperty","Get-PnPPropertyBag","Get-PnPPublishingImageRendition","Get-PnPRecycleBinItem","Get-PnPRequestAccessEmails","Get-PnPRoleDefinition","Get-PnPSearchConfiguration","Get-PnPSearchCrawlLog","Get-PnPSearchSettings","Get-PnPServiceCurrentHealth","Get-PnPServiceHealthIssue","Get-PnPServiceUpdateMessage","Get-PnPSharingForNonOwnersOfSite","Get-PnPSite","Get-PnPSiteClassification","Get-PnPSiteClosure","Get-PnPSiteCollectionAdmin","Get-PnPSiteCollectionAppCatalogs","Get-PnPSiteCollectionTermStore","Get-PnPSiteDesign","Get-PnPSiteDesignRights","Get-PnPSiteDesignRun","Get-PnPSiteDesignRunStatus","Get-PnPSiteDesignTask","Get-PnPSiteGroup","Get-PnPSitePolicy","Get-PnPSiteScript","Get-PnPSiteScriptFromList","Get-PnPSiteScriptFromWeb","Get-PnPSiteSearchQueryResults","Get-PnPSiteTemplate","Get-PnPSiteUserInvitations","Get-PnPStorageEntity","Get-PnPStoredCredential","Get-PnPStructuralNavigationCacheSiteState","Get-PnPStructuralNavigationCacheWebState","Get-PnPSubscribeSharePointNewsDigest","Get-PnPSubWeb","Get-PnPSyntexModel","Get-PnPSyntexModelPublication","Get-PnPTaxonomyItem","Get-PnPTaxonomySession","Get-PnPTeamsApp","Get-PnPTeamsChannel","Get-PnPTeamsChannelMessage","Get-PnPTeamsTab","Get-PnPTeamsTeam","Get-PnPTeamsUser","Get-PnPTemporarilyDisableAppBar","Get-PnPTenant","Get-PnPTenantAppCatalogUrl","Get-PnPTenantCdnEnabled","Get-PnPTenantCdnOrigin","Get-PnPTenantCdnPolicies","Get-PnPTenantDeletedSite","Get-PnPTenantId","Get-PnPTenantInstance","Get-PnPTenantRecycleBinItem","Get-PnPTenantSequence","Get-PnPTenantSequenceSite","Get-PnPTenantServicePrincipal","Get-PnPTenantServicePrincipalPermissionGrants","Get-PnPTenantServicePrincipalPermissionRequests","Get-PnPTenantSite","Get-PnPTenantSyncClientRestriction","Get-PnPTenantTemplate","Get-PnPTenantTheme","Get-PnPTerm","Get-PnPTermGroup","Get-PnPTermLabel","Get-PnPTermSet","Get-PnPTheme","Get-PnPTimeZoneId","Get-PnPUnifiedAuditLog","Get-PnPUPABulkImportStatus","Get-PnPUser","Get-PnPUserOneDriveQuota","Get-PnPUserProfileProperty","Get-PnPView","Get-PnPWeb","Get-PnPWebHeader","Get-PnPWebhookSubscriptions","Get-PnPWebPart","Get-PnPWebPartProperty","Get-PnPWebPartXml","Get-PnPWebTemplates","Get-PnPWikiPageContent","Grant-PnPAzureADAppSitePermission","Grant-PnPHubSiteRights","Grant-PnPSiteDesignRights","Grant-PnPTenantServicePrincipalPermission","Import-PnPTaxonomy","Import-PnPTermGroupFromXml","Import-PnPTermSet","Install-PnPApp","Invoke-PnPBatch","Invoke-PnPQuery","Invoke-PnPSiteDesign","Invoke-PnPSiteScript","Invoke-PnPSiteSwap","Invoke-PnPSiteTemplate","Invoke-PnPSPRestMethod","Invoke-PnPTenantTemplate","Invoke-PnPTransformation","Invoke-PnPWebAction","Measure-PnPList","Measure-PnPWeb","Move-ItemProxy","Move-PnPFile","Move-PnPFolder","Move-PnPListItemToRecycleBin","Move-PnPPageComponent","Move-PnPRecycleBinItem","New-PnPAzureADGroup","New-PnPAzureCertificate","New-PnPBatch","New-PnPExtensibilityHandlerObject","New-PnPGraphSubscription","New-PnPGroup","New-PnPList","New-PnPMicrosoft365Group","New-PnPPersonalSite","New-PnPPlannerPlan","New-PnPSdnProvider","New-PnPSite","New-PnPSiteCollectionTermStore","New-PnPSiteGroup","New-PnPSiteTemplate","New-PnPSiteTemplateFromFolder","New-PnPTeamsApp","New-PnPTeamsTeam","New-PnPTenantSequence","New-PnPTenantSequenceCommunicationSite","New-PnPTenantSequenceTeamNoGroupSite","New-PnPTenantSequenceTeamNoGroupSubSite","New-PnPTenantSequenceTeamSite","New-PnPTenantSite","New-PnPTenantTemplate","New-PnPTerm","New-PnPTermGroup","New-PnPTermLabel","New-PnPTermSet","New-PnPUPABulkImportJob","New-PnPUser","New-PnPWeb","Publish-PnPApp","Publish-PnPCompanyApp","Publish-PnPSyntexModel","Read-PnPSiteTemplate","Read-PnPTenantTemplate","Receive-PnPCopyMoveJobStatus","Register-PnPAppCatalogSite","Register-PnPAzureADApp","Register-PnPHubSite","Register-PnPManagementShellAccess","Remove-PnPAdaptiveScopeProperty","Remove-PnPAlert","Remove-PnPApp","Remove-PnPApplicationCustomizer","Remove-PnPAzureADApp","Remove-PnPAzureADGroup","Remove-PnPAzureADGroupMember","Remove-PnPAzureADGroupOwner","Remove-PnPContentType","Remove-PnPContentTypeFromDocumentSet","Remove-PnPContentTypeFromList","Remove-PnPCustomAction","Remove-PnPDeletedMicrosoft365Group","Remove-PnPEventReceiver","Remove-PnPExternalUser","Remove-PnPField","Remove-PnPFieldFromContentType","Remove-PnPFile","Remove-PnPFileFromSiteTemplate","Remove-PnPFileVersion","Remove-PnPFlow","Remove-PnPFolder","Remove-PnPGraphSubscription","Remove-PnPGroup","Remove-PnPGroupMember","Remove-PnPHomeSite","Remove-PnPHubSiteAssociation","Remove-PnPHubToHubAssociation","Remove-PnPIndexedProperty","Remove-PnPJavaScriptLink","Remove-PnPKnowledgeHubSite","Remove-PnPList","Remove-PnPListItem","Remove-PnPListItemComment","Remove-PnPMicrosoft365Group","Remove-PnPMicrosoft365GroupMember","Remove-PnPMicrosoft365GroupOwner","Remove-PnPNavigationNode","Remove-PnPOrgAssetsLibrary","Remove-PnPOrgNewsSite","Remove-PnPPage","Remove-PnPPageComponent","Remove-PnPPlannerBucket","Remove-PnPPlannerPlan","Remove-PnPPlannerRoster","Remove-PnPPlannerRosterMember","Remove-PnPPlannerTask","Remove-PnPPropertyBagValue","Remove-PnPPublishingImageRendition","Remove-PnPRoleDefinition","Remove-PnPSdnProvider","Remove-PnPSearchConfiguration","Remove-PnPSiteClassification","Remove-PnPSiteCollectionAdmin","Remove-PnPSiteCollectionAppCatalog","Remove-PnPSiteCollectionTermStore","Remove-PnPSiteDesign","Remove-PnPSiteDesignTask","Remove-PnPSiteGroup","Remove-PnPSiteScript","Remove-PnPSiteUserInvitations","Remove-PnPStorageEntity","Remove-PnPStoredCredential","Remove-PnPTaxonomyItem","Remove-PnPTeamsApp","Remove-PnPTeamsChannel","Remove-PnPTeamsTab","Remove-PnPTeamsTeam","Remove-PnPTeamsUser","Remove-PnPTenantCdnOrigin","Remove-PnPTenantDeletedSite","Remove-PnPTenantSite","Remove-PnPTenantSyncClientRestriction","Remove-PnPTenantTheme","Remove-PnPTerm","Remove-PnPTermGroup","Remove-PnPTermLabel","Remove-PnPUser","Remove-PnPUserInfo","Remove-PnPUserProfile","Remove-PnPView","Remove-PnPWeb","Remove-PnPWebhookSubscription","Remove-PnPWebPart","Remove-PnPWikiPage","Rename-PnPFile","Rename-PnPFolder","Repair-PnPSite","Request-PnPAccessToken","Request-PnPPersonalSite","Request-PnPReIndexList","Request-PnPReIndexWeb","Request-PnPSyntexClassifyAndExtract","Reset-PnPFileVersion","Reset-PnPLabel","Reset-PnPMicrosoft365GroupExpiration","Reset-PnPUserOneDriveQuotaToDefault","Resolve-PnPFolder","Restore-PnPDeletedMicrosoft365Group","Restore-PnPFileVersion","Restore-PnPRecycleBinItem","Restore-PnPTenantRecycleBinItem","Restore-PnPTenantSite","Revoke-PnPAzureADAppSitePermission","Revoke-PnPHubSiteRights","Revoke-PnPSiteDesignRights","Revoke-PnPTenantServicePrincipalPermission","Revoke-PnPUserSession","Save-PnPPageConversionLog","Save-PnPSiteTemplate","Save-PnPTenantTemplate","Send-PnPMail","Set-PnPAdaptiveScopeProperty","Set-PnPApplicationCustomizer","Set-PnPAppSideLoading","Set-PnPAuditing","Set-PnPAvailablePageLayouts","Set-PnPAzureADAppSitePermission","Set-PnPAzureADGroup","Set-PnPBrowserIdleSignout","Set-PnPBuiltInDesignPackageVisibility","Set-PnPBuiltInSiteTemplateSettings","Set-PnPContext","Set-PnPDefaultColumnValues","Set-PnPDefaultContentTypeToList","Set-PnPDefaultPageLayout","Set-PnPDisableSpacesActivation","Set-PnPDocumentSetField","Set-PnPField","Set-PnPFileCheckedIn","Set-PnPFileCheckedOut","Set-PnPFolderPermission","Set-PnPFooter","Set-PnPGraphSubscription","Set-PnPGroup","Set-PnPGroupPermissions","Set-PnPHideDefaultThemes","Set-PnPHomePage","Set-PnPHomeSite","Set-PnPHubSite","Set-PnPIndexedProperties","Set-PnPInPlaceRecordsManagement","Set-PnPKnowledgeHubSite","Set-PnPLabel","Set-PnPList","Set-PnPListInformationRightsManagement","Set-PnPListItem","Set-PnPListItemAsRecord","Set-PnPListItemPermission","Set-PnPListPermission","Set-PnPListRecordDeclaration","Set-PnPMasterPage","Set-PnPMicrosoft365Group","Set-PnPMinimalDownloadStrategy","Set-PnPPage","Set-PnPPageTextPart","Set-PnPPageWebPart","Set-PnPPlannerBucket","Set-PnPPlannerConfiguration","Set-PnPPlannerPlan","Set-PnPPlannerTask","Set-PnPPlannerUserPolicy","Set-PnPPropertyBagValue","Set-PnPRequestAccessEmails","Set-PnPRoleDefinition","Set-PnPSearchConfiguration","Set-PnPSearchSettings","Set-PnPSite","Set-PnPSiteClosure","Set-PnPSiteDesign","Set-PnPSiteGroup","Set-PnPSitePolicy","Set-PnPSiteScript","Set-PnPSiteScriptPackage","Set-PnPSiteTemplateMetadata","Set-PnPStorageEntity","Set-PnPStructuralNavigationCacheSiteState","Set-PnPStructuralNavigationCacheWebState","Set-PnPSubscribeSharePointNewsDigest","Set-PnPTaxonomyFieldValue","Set-PnPTeamifyPromptHidden","Set-PnPTeamsChannel","Set-PnPTeamsTab","Set-PnPTeamsTeam","Set-PnPTeamsTeamArchivedState","Set-PnPTeamsTeamPicture","Set-PnPTemporarilyDisableAppBar","Set-PnPTenant","Set-PnPTenantAppCatalogUrl","Set-PnPTenantCdnEnabled","Set-PnPTenantCdnPolicy","Set-PnPTenantSite","Set-PnPTenantSyncClientRestriction","Set-PnPTerm","Set-PnPTermGroup","Set-PnPTermSet","Set-PnPTheme","Set-PnPTraceLog","Set-PnPUserOneDriveQuota","Set-PnPUserProfileProperty","Set-PnPView","Set-PnPWeb","Set-PnPWebHeader","Set-PnPWebhookSubscription","Set-PnPWebPartProperty","Set-PnPWebPermission","Set-PnPWebTheme","Set-PnPWikiPageContent","Submit-PnPSearchQuery","Submit-PnPTeamsChannelMessage","Sync-PnPAppToTeams","Sync-PnPSharePointUserProfilesFromAzureActiveDirectory","Test-PnPListItemIsRecord","Test-PnPMicrosoft365GroupAliasIsUsed","Test-PnPSite","Test-PnPTenantTemplate","Uninstall-PnPApp","Unpublish-PnPApp","Unpublish-PnPSyntexModel","Unregister-PnPHubSite","Update-PnPApp","Update-PnPSiteClassification","Update-PnPSiteDesignFromWeb","Update-PnPTeamsApp","Update-PnPUserType")
	VariablesToExport = '*'
	AliasesToExport = '*'
	FormatsToProcess = 'PnP.PowerShell.Format.ps1xml' 
	PrivateData = @{
		PSData = @{
			Tags = 'SharePoint','PnP','Teams','Planner'
			ProjectUri = 'https://aka.ms/sppnp'
			IconUri = 'https://raw.githubusercontent.com/pnp/media/40e7cd8952a9347ea44e5572bb0e49622a102a12/parker/ms/300w/parker-ms-300.png'
		}
	}
}

# SIG # Begin signature block
# MIIntwYJKoZIhvcNAQcCoIInqDCCJ6QCAQExDzANBglghkgBZQMEAgEFADB5Bgor
# BgEEAYI3AgEEoGswaTA0BgorBgEEAYI3AgEeMCYCAwEAAAQQH8w7YFlLCE63JNLG
# KX7zUQIBAAIBAAIBAAIBAAIBADAxMA0GCWCGSAFlAwQCAQUABCDFx6OSVsHefThM
# 9cyB5/e1EOc/OtPzzeqRD2+wWG0JQKCCDYEwggX/MIID56ADAgECAhMzAAACUosz
# qviV8znbAAAAAAJSMA0GCSqGSIb3DQEBCwUAMH4xCzAJBgNVBAYTAlVTMRMwEQYD
# VQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24xKDAmBgNVBAMTH01pY3Jvc29mdCBDb2RlIFNpZ25p
# bmcgUENBIDIwMTEwHhcNMjEwOTAyMTgzMjU5WhcNMjIwOTAxMTgzMjU5WjB0MQsw
# CQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9u
# ZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMR4wHAYDVQQDExVNaWNy
# b3NvZnQgQ29ycG9yYXRpb24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
# AQDQ5M+Ps/X7BNuv5B/0I6uoDwj0NJOo1KrVQqO7ggRXccklyTrWL4xMShjIou2I
# sbYnF67wXzVAq5Om4oe+LfzSDOzjcb6ms00gBo0OQaqwQ1BijyJ7NvDf80I1fW9O
# L76Kt0Wpc2zrGhzcHdb7upPrvxvSNNUvxK3sgw7YTt31410vpEp8yfBEl/hd8ZzA
# v47DCgJ5j1zm295s1RVZHNp6MoiQFVOECm4AwK2l28i+YER1JO4IplTH44uvzX9o
# RnJHaMvWzZEpozPy4jNO2DDqbcNs4zh7AWMhE1PWFVA+CHI/En5nASvCvLmuR/t8
# q4bc8XR8QIZJQSp+2U6m2ldNAgMBAAGjggF+MIIBejAfBgNVHSUEGDAWBgorBgEE
# AYI3TAgBBggrBgEFBQcDAzAdBgNVHQ4EFgQUNZJaEUGL2Guwt7ZOAu4efEYXedEw
# UAYDVR0RBEkwR6RFMEMxKTAnBgNVBAsTIE1pY3Jvc29mdCBPcGVyYXRpb25zIFB1
# ZXJ0byBSaWNvMRYwFAYDVQQFEw0yMzAwMTIrNDY3NTk3MB8GA1UdIwQYMBaAFEhu
# ZOVQBdOCqhc3NyK1bajKdQKVMFQGA1UdHwRNMEswSaBHoEWGQ2h0dHA6Ly93d3cu
# bWljcm9zb2Z0LmNvbS9wa2lvcHMvY3JsL01pY0NvZFNpZ1BDQTIwMTFfMjAxMS0w
# Ny0wOC5jcmwwYQYIKwYBBQUHAQEEVTBTMFEGCCsGAQUFBzAChkVodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY0NvZFNpZ1BDQTIwMTFfMjAx
# MS0wNy0wOC5jcnQwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQsFAAOCAgEAFkk3
# uSxkTEBh1NtAl7BivIEsAWdgX1qZ+EdZMYbQKasY6IhSLXRMxF1B3OKdR9K/kccp
# kvNcGl8D7YyYS4mhCUMBR+VLrg3f8PUj38A9V5aiY2/Jok7WZFOAmjPRNNGnyeg7
# l0lTiThFqE+2aOs6+heegqAdelGgNJKRHLWRuhGKuLIw5lkgx9Ky+QvZrn/Ddi8u
# TIgWKp+MGG8xY6PBvvjgt9jQShlnPrZ3UY8Bvwy6rynhXBaV0V0TTL0gEx7eh/K1
# o8Miaru6s/7FyqOLeUS4vTHh9TgBL5DtxCYurXbSBVtL1Fj44+Od/6cmC9mmvrti
# yG709Y3Rd3YdJj2f3GJq7Y7KdWq0QYhatKhBeg4fxjhg0yut2g6aM1mxjNPrE48z
# 6HWCNGu9gMK5ZudldRw4a45Z06Aoktof0CqOyTErvq0YjoE4Xpa0+87T/PVUXNqf
# 7Y+qSU7+9LtLQuMYR4w3cSPjuNusvLf9gBnch5RqM7kaDtYWDgLyB42EfsxeMqwK
# WwA+TVi0HrWRqfSx2olbE56hJcEkMjOSKz3sRuupFCX3UroyYf52L+2iVTrda8XW
# esPG62Mnn3T8AuLfzeJFuAbfOSERx7IFZO92UPoXE1uEjL5skl1yTZB3MubgOA4F
# 8KoRNhviFAEST+nG8c8uIsbZeb08SeYQMqjVEmkwggd6MIIFYqADAgECAgphDpDS
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
# RcBCyZt2WwqASGv9eZ/BvW1taslScxMNelDNMYIZjDCCGYgCAQEwgZUwfjELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEoMCYGA1UEAxMfTWljcm9z
# b2Z0IENvZGUgU2lnbmluZyBQQ0EgMjAxMQITMwAAAlKLM6r4lfM52wAAAAACUjAN
# BglghkgBZQMEAgEFAKCBrjAZBgkqhkiG9w0BCQMxDAYKKwYBBAGCNwIBBDAcBgor
# BgEEAYI3AgELMQ4wDAYKKwYBBAGCNwIBFTAvBgkqhkiG9w0BCQQxIgQgtRCamfpE
# D+pT1q5q7Og1hCJhX/SBygsvnaASznp/Tc8wQgYKKwYBBAGCNwIBDDE0MDKgFIAS
# AE0AaQBjAHIAbwBzAG8AZgB0oRqAGGh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbTAN
# BgkqhkiG9w0BAQEFAASCAQAdeY8igK2nUbQZtM4+Yz2MZ/0iL7WYFw3VrChgL7K1
# EfB/6YdQ8S8bviwA+SS9nhhCRxTSbKGk7AzYMeedZnUdZZP34jPlw+ix/9QUUwuU
# /LltW6MNp6EytTcK7HoCrYCQrMTCDifYcGNBF2waUJIeuhoVla0j2jDwICNmknkH
# 14wQCMOED8NbmXBQnnCUBEl6OU5FrQXB7WGfn0eeTI/Ru/zw0rRh8aavJDnvjUyH
# m+B2fiS/tA37ljO1qkifb+OyZCqvJevuakalX38xdIKH5QW0z5+BzT3VSLBGIBWd
# zlDiB4/AD7gZMG6mOIOpkmsl0gxIyGs7FfbMU3I7NbGvoYIXFjCCFxIGCisGAQQB
# gjcDAwExghcCMIIW/gYJKoZIhvcNAQcCoIIW7zCCFusCAQMxDzANBglghkgBZQME
# AgEFADCCAVkGCyqGSIb3DQEJEAEEoIIBSASCAUQwggFAAgEBBgorBgEEAYRZCgMB
# MDEwDQYJYIZIAWUDBAIBBQAEIH+McT+gwSrBjvwB46sWtRcqlT7oJg+1RSekd0sY
# SPfmAgZhwc/E1i0YEzIwMjExMjIyMTU0OTQ0LjU2NVowBIACAfSggdikgdUwgdIx
# CzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRt
# b25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1p
# Y3Jvc29mdCBJcmVsYW5kIE9wZXJhdGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhh
# bGVzIFRTUyBFU046MDg0Mi00QkU2LUMyOUExJTAjBgNVBAMTHE1pY3Jvc29mdCBU
# aW1lLVN0YW1wIFNlcnZpY2WgghFlMIIHFDCCBPygAwIBAgITMwAAAYdCFmYEXPP0
# jQABAAABhzANBgkqhkiG9w0BAQsFADB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMK
# V2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0
# IENvcnBvcmF0aW9uMSYwJAYDVQQDEx1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0Eg
# MjAxMDAeFw0yMTEwMjgxOTI3MzlaFw0yMzAxMjYxOTI3MzlaMIHSMQswCQYDVQQG
# EwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMHUmVkbW9uZDEeMBwG
# A1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMS0wKwYDVQQLEyRNaWNyb3NvZnQg
# SXJlbGFuZCBPcGVyYXRpb25zIExpbWl0ZWQxJjAkBgNVBAsTHVRoYWxlcyBUU1Mg
# RVNOOjA4NDItNEJFNi1DMjlBMSUwIwYDVQQDExxNaWNyb3NvZnQgVGltZS1TdGFt
# cCBTZXJ2aWNlMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAvml4GWM9
# A6PREQiHgZAAPK6n+Th6m+LYwKYLaQFlZXbTqrodhsni7HVIRkqBFuG8og1KZry0
# 2xEmmbdp89O40xCIQfW8FKW7oO/lYYtUAQW2kp0uMuYEJ1XkZ6eHjcMuqEJwC47U
# akZx3AekakP+GfGuDDO9kZGQRe8IpiiJ4Qkn6mbDhbRpgcUOdsDzmNz6kXG7gfIf
# gcs5kzuKIP6nN4tsjPhyF58VU0ZfI0PSC+n5OX0hsU8heWe3pUiDr5gqP16a6kIj
# FJHkgNPYgMivGTQKcjNxNcXnnymT/JVuNs7Zvk1P5KWf8G1XG/MtZZ5/juqsg0Qo
# UmQZjVh0XRku7YpMpktW7XfFA3y+YJOG1pVzizB3PzJXUC8Ma8AUywtUuULWjYT5
# y7/EwwHWmn1RT0PhYp9kmpfS6HIYfEBboYUvULW2HnGNfx65f4Ukc7kgNSQbeAH6
# yjO5dg6MUwPfzo/rBdNaZfJxZ7RscTByTtlxblfUT46yPHCXACiX/BhaHEY4edFg
# p/cIb7XHFJbu4mNDAPzRlAkIj1SGuO9G4sbkjM9XpNMWglj2dC9QLN/0geBFXoNI
# 8F+HfHw4Jo+p6iSP8hn43mkkWKSGOiT4hLJzocErFntK5i9PebXSq2BvMgzVc+BB
# vCN35DfD0mokRKxam2tQM060SORy3S7ucesCAwEAAaOCATYwggEyMB0GA1UdDgQW
# BBQiUcAWukEtYYF+3WFzmZA/DaWNIDAfBgNVHSMEGDAWgBSfpxVdAF5iXYP05dJl
# pxtTNRnpcjBfBgNVHR8EWDBWMFSgUqBQhk5odHRwOi8vd3d3Lm1pY3Jvc29mdC5j
# b20vcGtpb3BzL2NybC9NaWNyb3NvZnQlMjBUaW1lLVN0YW1wJTIwUENBJTIwMjAx
# MCgxKS5jcmwwbAYIKwYBBQUHAQEEYDBeMFwGCCsGAQUFBzAChlBodHRwOi8vd3d3
# Lm1pY3Jvc29mdC5jb20vcGtpb3BzL2NlcnRzL01pY3Jvc29mdCUyMFRpbWUtU3Rh
# bXAlMjBQQ0ElMjAyMDEwKDEpLmNydDAMBgNVHRMBAf8EAjAAMBMGA1UdJQQMMAoG
# CCsGAQUFBwMIMA0GCSqGSIb3DQEBCwUAA4ICAQC5q35T2RKjAFRN/3cYjnPFztPa
# 7KeqJKJnKgviUj9IMfC8/FQ2ox6Uwyd40TS7zKvtuMl11FFlfWkEncN3lqihiSAq
# IDPOdVvr1oJY4NFQBOHzLpetepHnMg0UL2UXHzvjKg24VOIzb0dtdP69+QIy7SDp
# cVh9KI0EXKG2bolpBypqRttGTDd0JQkOtMdiSpaDpOHwgCMNXE8xIu48hiuT075o
# IqnHJha378/DpugI0DZjYcZH1cG84J06ucq5ygrod9szr19ObCZJdJLpyvJWCy8P
# RDAkRjPJglSmfn2UR0KvnoyCOzjszAwNCp/JJnkRp20weItzm97iNg+FZF1J9E16
# eWIB1sCr7Vj9QD6Kt+z81rOcLRfxhlO2/sK09Uw+DiQkPbu6OZ3TsDvLsr8yG9W2
# A8yXcggNqd4XpLtdEkf52OIN0GgRLSY1LNDB4IKY+Zj34IwMbDbs2sCig5Li2ILW
# EMV/6gyL37J71NbW7Vzo7fcGrNne9OqxgFC2WX5degxyJ3Sx2bKw6lbf04KaXnTB
# OSz0QC+RfJuz8nOpIf28+WmMPicX2l7gs/MrC5anmyK/nbeKkaOx+AXhwYLzETNg
# +1IcygjdwnbqWKafLdCNKfhsb/gM5SFbgD5ATEX1bAxwUFVxKvQv0dIRAm5aDjF3
# DZpgvy3mSojSrBN/8zCCB3EwggVZoAMCAQICEzMAAAAVxedrngKbSZkAAAAAABUw
# DQYJKoZIhvcNAQELBQAwgYgxCzAJBgNVBAYTAlVTMRMwEQYDVQQIEwpXYXNoaW5n
# dG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3NvZnQgQ29ycG9y
# YXRpb24xMjAwBgNVBAMTKU1pY3Jvc29mdCBSb290IENlcnRpZmljYXRlIEF1dGhv
# cml0eSAyMDEwMB4XDTIxMDkzMDE4MjIyNVoXDTMwMDkzMDE4MzIyNVowfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
# ggIKAoICAQDk4aZM57RyIQt5osvXJHm9DtWC0/3unAcH0qlsTnXIyjVX9gF/bErg
# 4r25PhdgM/9cT8dm95VTcVrifkpa/rg2Z4VGIwy1jRPPdzLAEBjoYH1qUoNEt6aO
# RmsHFPPFdvWGUNzBRMhxXFExN6AKOG6N7dcP2CZTfDlhAnrEqv1yaa8dq6z2Nr41
# JmTamDu6GnszrYBbfowQHJ1S/rboYiXcag/PXfT+jlPP1uyFVk3v3byNpOORj7I5
# LFGc6XBpDco2LXCOMcg1KL3jtIckw+DJj361VI/c+gVVmG1oO5pGve2krnopN6zL
# 64NF50ZuyjLVwIYwXE8s4mKyzbnijYjklqwBSru+cakXW2dg3viSkR4dPf0gz3N9
# QZpGdc3EXzTdEonW/aUgfX782Z5F37ZyL9t9X4C626p+Nuw2TPYrbqgSUei/BQOj
# 0XOmTTd0lBw0gg/wEPK3Rxjtp+iZfD9M269ewvPV2HM9Q07BMzlMjgK8QmguEOqE
# UUbi0b1qGFphAXPKZ6Je1yh2AuIzGHLXpyDwwvoSCtdjbwzJNmSLW6CmgyFdXzB0
# kZSU2LlQ+QuJYfM2BjUYhEfb3BvR/bLUHMVr9lxSUV0S2yW6r1AFemzFER1y7435
# UsSFF5PAPBXbGjfHCBUYP3irRbb1Hode2o+eFnJpxq57t7c+auIurQIDAQABo4IB
# 3TCCAdkwEgYJKwYBBAGCNxUBBAUCAwEAATAjBgkrBgEEAYI3FQIEFgQUKqdS/mTE
# mr6CkTxGNSnPEP8vBO4wHQYDVR0OBBYEFJ+nFV0AXmJdg/Tl0mWnG1M1GelyMFwG
# A1UdIARVMFMwUQYMKwYBBAGCN0yDfQEBMEEwPwYIKwYBBQUHAgEWM2h0dHA6Ly93
# d3cubWljcm9zb2Z0LmNvbS9wa2lvcHMvRG9jcy9SZXBvc2l0b3J5Lmh0bTATBgNV
# HSUEDDAKBggrBgEFBQcDCDAZBgkrBgEEAYI3FAIEDB4KAFMAdQBiAEMAQTALBgNV
# HQ8EBAMCAYYwDwYDVR0TAQH/BAUwAwEB/zAfBgNVHSMEGDAWgBTV9lbLj+iiXGJo
# 0T2UkFvXzpoYxDBWBgNVHR8ETzBNMEugSaBHhkVodHRwOi8vY3JsLm1pY3Jvc29m
# dC5jb20vcGtpL2NybC9wcm9kdWN0cy9NaWNSb29DZXJBdXRfMjAxMC0wNi0yMy5j
# cmwwWgYIKwYBBQUHAQEETjBMMEoGCCsGAQUFBzAChj5odHRwOi8vd3d3Lm1pY3Jv
# c29mdC5jb20vcGtpL2NlcnRzL01pY1Jvb0NlckF1dF8yMDEwLTA2LTIzLmNydDAN
# BgkqhkiG9w0BAQsFAAOCAgEAnVV9/Cqt4SwfZwExJFvhnnJL/Klv6lwUtj5OR2R4
# sQaTlz0xM7U518JxNj/aZGx80HU5bbsPMeTCj/ts0aGUGCLu6WZnOlNN3Zi6th54
# 2DYunKmCVgADsAW+iehp4LoJ7nvfam++Kctu2D9IdQHZGN5tggz1bSNU5HhTdSRX
# ud2f8449xvNo32X2pFaq95W2KFUn0CS9QKC/GbYSEhFdPSfgQJY4rPf5KYnDvBew
# VIVCs/wMnosZiefwC2qBwoEZQhlSdYo2wh3DYXMuLGt7bj8sCXgU6ZGyqVvfSaN0
# DLzskYDSPeZKPmY7T7uG+jIa2Zb0j/aRAfbOxnT99kxybxCrdTDFNLB62FD+Cljd
# QDzHVG2dY3RILLFORy3BFARxv2T5JL5zbcqOCb2zAVdJVGTZc9d/HltEAY5aGZFr
# DZ+kKNxnGSgkujhLmm77IVRrakURR6nxt67I6IleT53S0Ex2tVdUCbFpAUR+fKFh
# bHP+CrvsQWY9af3LwUFJfn6Tvsv4O+S3Fb+0zj6lMVGEvL8CwYKiexcdFYmNcP7n
# tdAoGokLjzbaukz5m/8K6TT4JDVnK+ANuOaMmdbhIurwJ0I9JZTmdHRbatGePu1+
# oDEzfbzL6Xu/OHBE0ZDxyKs6ijoIYn/ZcGNTTY3ugm2lBRDBcQZqELQdVTNYs6Fw
# ZvKhggLUMIICPQIBATCCAQChgdikgdUwgdIxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xLTArBgNVBAsTJE1pY3Jvc29mdCBJcmVsYW5kIE9wZXJh
# dGlvbnMgTGltaXRlZDEmMCQGA1UECxMdVGhhbGVzIFRTUyBFU046MDg0Mi00QkU2
# LUMyOUExJTAjBgNVBAMTHE1pY3Jvc29mdCBUaW1lLVN0YW1wIFNlcnZpY2WiIwoB
# ATAHBgUrDgMCGgMVAHh3k1QEKAZEhsLGYGHtf/6DG4PzoIGDMIGApH4wfDELMAkG
# A1UEBhMCVVMxEzARBgNVBAgTCldhc2hpbmd0b24xEDAOBgNVBAcTB1JlZG1vbmQx
# HjAcBgNVBAoTFU1pY3Jvc29mdCBDb3Jwb3JhdGlvbjEmMCQGA1UEAxMdTWljcm9z
# b2Z0IFRpbWUtU3RhbXAgUENBIDIwMTAwDQYJKoZIhvcNAQEFBQACBQDlbZ+7MCIY
# DzIwMjExMjIyMjA1OTM5WhgPMjAyMTEyMjMyMDU5MzlaMHQwOgYKKwYBBAGEWQoE
# ATEsMCowCgIFAOVtn7sCAQAwBwIBAAICClcwBwIBAAICESEwCgIFAOVu8TsCAQAw
# NgYKKwYBBAGEWQoEAjEoMCYwDAYKKwYBBAGEWQoDAqAKMAgCAQACAwehIKEKMAgC
# AQACAwGGoDANBgkqhkiG9w0BAQUFAAOBgQCu7/VJLYcl8MQ9wzhMPpvY+pgZPz9T
# oLR6WMRFlCmM9QeJ31ZUBIH0i4my5YUvGnlvqmxvTQsoYClzotqaIDz+LCmU6oDY
# Kp4Q2cqdx20oM8Ec4dvkak1ltKAebut2tIPyd89bfsBU7KgJ7zl3Am5mTMcMGX0k
# L9HF8wYmGDAuGTGCBA0wggQJAgEBMIGTMHwxCzAJBgNVBAYTAlVTMRMwEQYDVQQI
# EwpXYXNoaW5ndG9uMRAwDgYDVQQHEwdSZWRtb25kMR4wHAYDVQQKExVNaWNyb3Nv
# ZnQgQ29ycG9yYXRpb24xJjAkBgNVBAMTHU1pY3Jvc29mdCBUaW1lLVN0YW1wIFBD
# QSAyMDEwAhMzAAABh0IWZgRc8/SNAAEAAAGHMA0GCWCGSAFlAwQCAQUAoIIBSjAa
# BgkqhkiG9w0BCQMxDQYLKoZIhvcNAQkQAQQwLwYJKoZIhvcNAQkEMSIEIAzOUoL8
# jWxv9GlXvZ7ZFvlLicMMPcNqcJwAqTZCFBIzMIH6BgsqhkiG9w0BCRACLzGB6jCB
# 5zCB5DCBvQQgxCzwoBNuoB92wsC2SxZhz4HVGyvCZnwYNuczpGyam1gwgZgwgYCk
# fjB8MQswCQYDVQQGEwJVUzETMBEGA1UECBMKV2FzaGluZ3RvbjEQMA4GA1UEBxMH
# UmVkbW9uZDEeMBwGA1UEChMVTWljcm9zb2Z0IENvcnBvcmF0aW9uMSYwJAYDVQQD
# Ex1NaWNyb3NvZnQgVGltZS1TdGFtcCBQQ0EgMjAxMAITMwAAAYdCFmYEXPP0jQAB
# AAABhzAiBCDUSgoqtbdCkyUausOpO831+rS8pTVaw3OOviwk8VgHuTANBgkqhkiG
# 9w0BAQsFAASCAgCjUEk5dWAEqYOBx13zm8iIHIn2S4oOfTSo3FZVU8jPYtMEjyPp
# zCulEDG+FPXnhNHlH0EkR3SSHh+CV1fDNoJfuh6F2wzAkMBlMd81NNUtfgGM8OwL
# Ve7lQ98zr5f2HWtoyuSZJarUa2N8Ty6iwBfvEbN4buMN7rqlTB39uhyshZRqi2Vc
# Qwq2ew04aM3CVm2LzusLZt+QKRTp3DHYLEHRqUHoDwlbJN+dUAStYmd5hThZBp2G
# ZL5mzjc6OX0+mbXuG3P9vm9uuMfqfmS0qug4PCIqRQDOBmQWBXDohMfQJxrk2mOV
# BkvuSo0WHvbFDnMtNAJjR/Mg8Knaj3MOGUsJ9RWIkMOXh8XE55vMzwwOxaSzf+o5
# OlHQriddRMUigZCGlOS2Z7pYGeY3ipHKIocMuWFtH2EYlFKzB3fdXtKh/elPzPwh
# ujUZY+YLq3ZJqKcQBPtO+Vm5Lub2bHKxMim36paycymr4SuzR0s51Yx0P3cvP51i
# D8ctX2YlOlYfQuKE6Ngy2WM5irNg1+CV+Ove2jtM/hbOr/YufFidN3ocVw4QA+aJ
# K3uxgmU0IFh0he3b4NZ5rMcY708HecqKFEzq3uUex+Ksn8u0rmZjZkpTixSJaBKK
# Kt0cOT4iwQa7gm2nAiJDLkqxFrN5FAybaUTHo2phMItoJ7qgtN7cOtbydA==
# SIG # End signature block
