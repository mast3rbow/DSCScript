# Generated with Microsoft365DSC version 1.22.112.1
# For additional information on how to use Microsoft365DSC, please visit https://aka.ms/M365DSC
param (
    [parameter()]
    [System.Management.Automation.PSCredential]
    $Credential
)

Configuration M365TenantConfig
{
    param (
        [parameter()]
        [System.Management.Automation.PSCredential]
        $Credential
    )

    if ($null -eq $Credential)
    {
        <# Credentials #>
        $Credscredential = Get-Credential -Message "Credentials"

    }
    else
    {
        $CredsCredential = $Credential
    }

    $OrganizationName = $CredsCredential.UserName.Split('@')[1]
    Import-DscResource -ModuleName 'Microsoft365DSC' -ModuleVersion '1.22.112.1'

    Node localhost
    {
        AADGroupsSettings bc5ea03f-aa64-40d6-9ddb-14103c342d34
        {
            Credential           = $Credscredential;
            Ensure               = "Absent";
            IsSingleInstance     = "Yes";
        }

        EXOAntiPhishPolicy e2731f36-1698-4da1-bd56-538879dc03fb
        {
            AdminDisplayName                              = "";
            AuthenticationFailAction                      = "MoveToJmf";
            Credential                                    = $Credscredential;
            Enabled                                       = $True;
            EnableFirstContactSafetyTips                  = $False;
            EnableMailboxIntelligence                     = $True;
            EnableMailboxIntelligenceProtection           = $False;
            EnableOrganizationDomainsProtection           = $False;
            EnableSimilarDomainsSafetyTips                = $False;
            EnableSimilarUsersSafetyTips                  = $False;
            EnableSpoofIntelligence                       = $True;
            EnableTargetedDomainsProtection               = $False;
            EnableTargetedUserProtection                  = $False;
            EnableUnauthenticatedSender                   = $True;
            EnableUnusualCharactersSafetyTips             = $False;
            EnableViaTag                                  = $True;
            Ensure                                        = "Present";
            ExcludedDomains                               = @();
            ExcludedSenders                               = @();
            Identity                                      = "Anti-phishing";
            ImpersonationProtectionState                  = "Manual";
            MailboxIntelligenceProtectionAction           = "NoAction";
            MailboxIntelligenceProtectionActionRecipients = @();
            MakeDefault                                   = $False;
            PhishThresholdLevel                           = 1;
            TargetedDomainActionRecipients                = @();
            TargetedDomainsToProtect                      = @();
            TargetedUserActionRecipients                  = @();
            TargetedUserProtectionAction                  = "NoAction";
            TargetedUsersToProtect                        = @();
        }
        EXOAntiPhishPolicy 4cad6fd5-af4c-4bde-ba35-57f2621edb37
        {
            AdminDisplayName                              = "";
            AuthenticationFailAction                      = "MoveToJmf";
            Credential                                    = $Credscredential;
            Enabled                                       = $True;
            EnableFirstContactSafetyTips                  = $False;
            EnableMailboxIntelligence                     = $True;
            EnableMailboxIntelligenceProtection           = $False;
            EnableOrganizationDomainsProtection           = $False;
            EnableSimilarDomainsSafetyTips                = $True;
            EnableSimilarUsersSafetyTips                  = $True;
            EnableSpoofIntelligence                       = $True;
            EnableTargetedDomainsProtection               = $False;
            EnableTargetedUserProtection                  = $False;
            EnableUnauthenticatedSender                   = $True;
            EnableUnusualCharactersSafetyTips             = $False;
            EnableViaTag                                  = $True;
            Ensure                                        = "Present";
            ExcludedDomains                               = @();
            ExcludedSenders                               = @();
            Identity                                      = "Office365 AntiPhish Default";
            ImpersonationProtectionState                  = "Automatic";
            MailboxIntelligenceProtectionAction           = "NoAction";
            MailboxIntelligenceProtectionActionRecipients = @();
            MakeDefault                                   = $True;
            PhishThresholdLevel                           = 1;
            TargetedDomainActionRecipients                = @();
            TargetedDomainsToProtect                      = @();
            TargetedUserActionRecipients                  = @();
            TargetedUserProtectionAction                  = "NoAction";
            TargetedUsersToProtect                        = @();
        }
        EXOAtpPolicyForO365 f3665cc4-7941-4e25-8c5f-322be8088f44
        {
            AllowClickThrough             = $False;
            AllowSafeDocsOpen             = $True;
            BlockUrls                     = @();
            Credential                    = $Credscredential;
            EnableATPForSPOTeamsODB       = $True;
            EnableSafeDocs                = $True;
            EnableSafeLinksForO365Clients = $True;
            Ensure                        = "Present";
            Identity                      = "Default";
            IsSingleInstance              = "Yes";
            TrackClicks                   = $False;
        }
        EXODkimSigningConfig 81b63e7a-8024-4933-8e08-21db007c3c33
        {
            AdminDisplayName       = "";
            BodyCanonicalization   = "Relaxed";
            Credential             = $Credscredential;
            Enabled                = $True;
            Ensure                 = "Present";
            HeaderCanonicalization = "Relaxed";
            Identity               = "youremployment.onmicrosoft.com";
            KeySize                = 1024;
        }
        EXODkimSigningConfig 95d6c5ec-8259-43b1-bc22-d57a8953da99
        {
            AdminDisplayName       = "";
            BodyCanonicalization   = "Relaxed";
            Credential             = $Credscredential;
            Enabled                = $True;
            Ensure                 = "Present";
            HeaderCanonicalization = "Relaxed";
            Identity               = "tccq.com.au";
            KeySize                = 1024;
        }
        EXODkimSigningConfig 093c1b71-2a83-4670-9623-4d759ac8c7d9
        {
            AdminDisplayName       = "";
            BodyCanonicalization   = "Relaxed";
            Credential             = $Credscredential;
            Enabled                = $True;
            Ensure                 = "Present";
            HeaderCanonicalization = "Relaxed";
            Identity               = "thecommunitycollectiveqld.com.au";
            KeySize                = 1024;
        }
        EXOHostedContentFilterPolicy bf07ca13-1d63-4f54-978c-535ab91c89e8
        {
            AddXHeaderValue                      = "";
            AdminDisplayName                     = "";
            BulkSpamAction                       = "Quarantine";
            BulkThreshold                        = 6;
            Credential                           = $Credscredential;
            DownloadLink                         = $False;
            EnableEndUserSpamNotifications       = $True;
            EnableLanguageBlockList              = $False;
            EnableRegionBlockList                = $False;
            EndUserSpamNotificationCustomSubject = "";
            EndUserSpamNotificationFrequency     = 3;
            EndUserSpamNotificationLanguage      = "Default";
            Ensure                               = "Present";
            HighConfidencePhishAction            = "Quarantine";
            HighConfidenceSpamAction             = "Quarantine";
            Identity                             = "Default";
            IncreaseScoreWithBizOrInfoUrls       = "On";
            IncreaseScoreWithImageLinks          = "Off";
            IncreaseScoreWithNumericIps          = "On";
            IncreaseScoreWithRedirectToOtherPort = "On";
            InlineSafetyTipsEnabled              = $True;
            LanguageBlockList                    = @();
            MakeDefault                          = $True;
            MarkAsSpamBulkMail                   = "On";
            MarkAsSpamEmbedTagsInHtml            = "On";
            MarkAsSpamEmptyMessages              = "On";
            MarkAsSpamFormTagsInHtml             = "On";
            MarkAsSpamFramesInHtml               = "On";
            MarkAsSpamFromAddressAuthFail        = "On";
            MarkAsSpamJavaScriptInHtml           = "On";
            MarkAsSpamNdrBackscatter             = "On";
            MarkAsSpamObjectTagsInHtml           = "On";
            MarkAsSpamSensitiveWordList          = "On";
            MarkAsSpamSpfRecordHardFail          = "On";
            MarkAsSpamWebBugsInHtml              = "On";
            ModifySubjectValue                   = "";
            PhishSpamAction                      = "Quarantine";
            PhishZapEnabled                      = $True;
            QuarantineRetentionPeriod            = 30;
            RedirectToRecipients                 = @();
            RegionBlockList                      = @();
            SpamAction                           = "MoveToJmf";
            SpamZapEnabled                       = $True;
            TestModeAction                       = "None";
            TestModeBccToRecipients              = @();
        }
        EXOHostedOutboundSpamFilterPolicy 3b094ee8-cab0-42e1-b5ff-685403020d36
        {
            ActionWhenThresholdReached                = "BlockUserForToday";
            AdminDisplayName                          = "";
            AutoForwardingMode                        = "Automatic";
            BccSuspiciousOutboundAdditionalRecipients = @();
            BccSuspiciousOutboundMail                 = $False;
            Credential                                = $Credscredential;
            Ensure                                    = "Present";
            Identity                                  = "Default";
            NotifyOutboundSpam                        = $False;
            NotifyOutboundSpamRecipients              = @();
            RecipientLimitExternalPerHour             = 0;
            RecipientLimitInternalPerHour             = 0;
            RecipientLimitPerDay                      = 0;
        }
        EXOInboundConnector 4ed4298d-f279-413f-8110-154221cbbc21
        {
            AssociatedAcceptedDomains    = @();
            CloudServicesMailEnabled     = $True;
            Comment                      = "MFP scanners and printers to enable Scan to email functionality";
            ConnectorSource              = "Default";
            ConnectorType                = "OnPremises";
            Credential                   = $Credscredential;
            Enabled                      = $True;
            Ensure                       = "Present";
            Identity                     = "MFP - Scan to email";
            RequireTls                   = $False;
            RestrictDomainsToCertificate = $False;
            RestrictDomainsToIPAddresses = $True;
            SenderDomains                = @("smtp:*;1");
            SenderIPAddresses            = @("110.145.109.118/32","149.135.55.242/32");
            TreatMessagesAsInternal      = $False;
        }
        EXOMailTips da715a8f-089b-42d7-8f2f-21b917d6fb42
        {
            Credential                            = $Credscredential;
            Ensure                                = "Present";
            MailTipsAllTipsEnabled                = $True;
            MailTipsExternalRecipientsTipsEnabled = $False;
            MailTipsGroupMetricsEnabled           = $True;
            MailTipsLargeAudienceThreshold        = 25;
            MailTipsMailboxSourcedTipsEnabled     = $True;
            Organization                          = "$OrganizationName";
        }
        EXOMalwareFilterPolicy 6a5bbbe1-1ab5-468d-8576-944a8769d295
        {
            Action                                 = "DeleteAttachmentAndUseDefaultAlert";
            Credential                             = $Credscredential;
            CustomNotifications                    = $False;
            EnableExternalSenderAdminNotifications = $False;
            EnableExternalSenderNotifications      = $False;
            EnableFileFilter                       = $True;
            EnableInternalSenderAdminNotifications = $False;
            EnableInternalSenderNotifications      = $True;
            Ensure                                 = "Present";
            FileTypes                              = @("ace","ani","app","docm","exe","jar","reg","scr","vbe","vbs");
            Identity                               = "Default";
            MakeDefault                            = $True;
            ZapEnabled                             = $True;
        }
        EXOMobileDeviceMailboxPolicy d2933469-0ff0-4d0b-a716-5c638cbc2f83
        {
            AllowApplePushNotifications              = $True;
            AllowBluetooth                           = "Allow";
            AllowBrowser                             = $True;
            AllowCamera                              = $True;
            AllowConsumerEmail                       = $True;
            AllowDesktopSync                         = $True;
            AllowExternalDeviceManagement            = $False;
            AllowGooglePushNotifications             = $True;
            AllowHTMLEmail                           = $True;
            AllowInternetSharing                     = $True;
            AllowIrDA                                = $True;
            AllowMicrosoftPushNotifications          = $True;
            AllowMobileOTAUpdate                     = $True;
            AllowNonProvisionableDevices             = $True;
            AllowPOPIMAPEmail                        = $True;
            AllowRemoteDesktop                       = $True;
            AllowSimplePassword                      = $True;
            AllowSMIMEEncryptionAlgorithmNegotiation = "AllowAnyAlgorithmNegotiation";
            AllowSMIMESoftCerts                      = $True;
            AllowStorageCard                         = $True;
            AllowTextMessaging                       = $True;
            AllowUnsignedApplications                = $True;
            AllowUnsignedInstallationPackages        = $True;
            AllowWiFi                                = $True;
            AlphanumericPasswordRequired             = $False;
            ApprovedApplicationList                  = @();
            AttachmentsEnabled                       = $True;
            Credential                               = $Credscredential;
            DeviceEncryptionEnabled                  = $False;
            DevicePolicyRefreshInterval              = "Unlimited";
            Ensure                                   = "Present";
            IrmEnabled                               = $True;
            IsDefault                                = $True;
            MaxAttachmentSize                        = "Unlimited";
            MaxCalendarAgeFilter                     = "All";
            MaxEmailAgeFilter                        = "All";
            MaxEmailBodyTruncationSize               = "Unlimited";
            MaxEmailHTMLBodyTruncationSize           = "Unlimited";
            MaxInactivityTimeLock                    = "Unlimited";
            MaxPasswordFailedAttempts                = "Unlimited";
            MinPasswordComplexCharacters             = 1;
            Name                                     = "Default";
            PasswordEnabled                          = $False;
            PasswordExpiration                       = "Unlimited";
            PasswordHistory                          = 0;
            PasswordRecoveryEnabled                  = $False;
            RequireDeviceEncryption                  = $False;
            RequireEncryptedSMIMEMessages            = $False;
            RequireEncryptionSMIMEAlgorithm          = "TripleDES";
            RequireManualSyncWhenRoaming             = $False;
            RequireSignedSMIMEAlgorithm              = "SHA1";
            RequireSignedSMIMEMessages               = $False;
            RequireStorageCardEncryption             = $False;
            UnapprovedInROMApplicationList           = @();
            UNCAccessEnabled                         = $True;
            WSSAccessEnabled                         = $True;
        }
        EXOOrganizationConfig b0bc1220-3488-4382-96cb-fefb09518573
        {
            ActivityBasedAuthenticationTimeoutEnabled                 = $True;
            ActivityBasedAuthenticationTimeoutInterval                = "06:00:00";
            ActivityBasedAuthenticationTimeoutWithSingleSignOnEnabled = $True;
            AppsForOfficeEnabled                                      = $True;
            AsyncSendEnabled                                          = $True;
            AuditDisabled                                             = $False;
            AutoExpandingArchive                                      = $False;
            BookingsEnabled                                           = $True;
            BookingsPaymentsEnabled                                   = $False;
            BookingsSocialSharingRestricted                           = $False;
            ByteEncoderTypeFor7BitCharsets                            = 0;
            ConnectorsActionableMessagesEnabled                       = $True;
            ConnectorsEnabled                                         = $True;
            ConnectorsEnabledForOutlook                               = $True;
            ConnectorsEnabledForSharepoint                            = $True;
            ConnectorsEnabledForTeams                                 = $True;
            ConnectorsEnabledForYammer                                = $True;
            Credential                                                = $Credscredential;
            DefaultGroupAccessType                                    = "Private";
            DefaultPublicFolderDeletedItemRetention                   = "30.00:00:00";
            DefaultPublicFolderIssueWarningQuota                      = "1.7 GB (1,825,361,920 bytes)";
            DefaultPublicFolderMaxItemSize                            = "Unlimited";
            DefaultPublicFolderMovedItemRetention                     = "7.00:00:00";
            DefaultPublicFolderProhibitPostQuota                      = "2 GB (2,147,483,648 bytes)";
            DirectReportsGroupAutoCreationEnabled                     = $False;
            DistributionGroupNameBlockedWordsList                     = @();
            DistributionGroupNamingPolicy                             = "";
            ElcProcessingDisabled                                     = $False;
            EndUserDLUpgradeFlowsDisabled                             = $False;
            ExchangeNotificationEnabled                               = $True;
            ExchangeNotificationRecipients                            = @();
            IPListBlocked                                             = @();
            IsSingleInstance                                          = "Yes";
            LeanPopoutEnabled                                         = $False;
            LinkPreviewEnabled                                        = $True;
            MailTipsAllTipsEnabled                                    = $True;
            MailTipsExternalRecipientsTipsEnabled                     = $False;
            MailTipsGroupMetricsEnabled                               = $True;
            MailTipsLargeAudienceThreshold                            = 25;
            MailTipsMailboxSourcedTipsEnabled                         = $True;
            OAuth2ClientProfileEnabled                                = $True;
            OutlookMobileGCCRestrictionsEnabled                       = $False;
            OutlookPayEnabled                                         = $True;
            PublicComputersDetectionEnabled                           = $False;
            PublicFoldersEnabled                                      = "Local";
            PublicFolderShowClientControl                             = $False;
            ReadTrackingEnabled                                       = $False;
            RemotePublicFolderMailboxes                               = @();
            SmtpActionableMessagesEnabled                             = $True;
            VisibleMeetingUpdateProperties                            = "Location,AllProperties:15";
            WebPushNotificationsDisabled                              = $False;
            WebSuggestedRepliesDisabled                               = $False;
        }
        EXOOwaMailboxPolicy 10605533-b5da-4853-9415-1693020cccd3
        {
            ActionForUnknownFileAndMIMETypes                     = "Allow";
            ActiveSyncIntegrationEnabled                         = $True;
            AdditionalStorageProvidersAvailable                  = $True;
            AllAddressListsEnabled                               = $True;
            AllowCopyContactsToDeviceAddressBook                 = $True;
            AllowedFileTypes                                     = @(".rpmsg",".xlsx",".xlsm",".xlsb",".tiff",".pptx",".pptm",".ppsx",".ppsm",".docx",".docm",".zip",".xls",".wmv",".wma",".wav",".vsd",".txt",".tif",".rtf",".pub",".ppt",".png",".pdf",".one",".mp3",".jpg",".gif",".doc",".bmp",".avi");
            AllowedMimeTypes                                     = @("image/jpeg","image/png","image/gif","image/bmp");
            BlockedFileTypes                                     = @(".settingcontent-ms",".printerexport",".appcontent-ms",".appref-ms",".vsmacros",".website",".msh2xml",".msh1xml",".diagcab",".webpnp",".ps2xml",".ps1xml",".mshxml",".gadget",".theme",".psdm1",".mhtml",".cdxml",".xbap",".vhdx",".pyzw",".pssc",".psd1",".psc2",".psc1",".msh2",".msh1",".jnlp",".aspx",".appx",".xnk",".xll",".wsh",".wsf",".wsc",".wsb",".vsw",".vst",".vss",".vhd",".vbs",".vbp",".vbe",".url",".udl",".tmp",".shs",".shb",".sct",".scr",".scf",".reg",".pyz",".pyw",".pyo",".pyc",".pst",".ps2",".ps1",".prg",".prf",".plg",".pif",".pcd",".ops",".msu",".mst",".msp",".msi",".msh",".msc",".mht",".mdz",".mdw",".mdt",".mde",".mdb",".mda",".mcf",".maw",".mav",".mau",".mat",".mas",".mar",".maq",".mam",".mag",".maf",".mad",".lnk",".ksh",".jse",".jar",".its",".isp",".ins",".inf",".htc",".hta",".hpj",".hlp",".grp",".fxp",".exe",".der",".csh",".crt",".cpl",".com",".cnt",".cmd",".chm",".cer",".bat",".bas",".asx",".asp",".app",".apk",".adp",".ade",".ws",".vb",".py",".pl",".js");
            BlockedMimeTypes                                     = @("application/x-javascript","application/javascript","application/msaccess","x-internet-signup","text/javascript","application/prg","application/hta","text/scriplet");
            ClassicAttachmentsEnabled                            = $True;
            ConditionalAccessPolicy                              = "Off";
            Credential                                           = $Credscredential;
            DefaultTheme                                         = "";
            DirectFileAccessOnPrivateComputersEnabled            = $True;
            DirectFileAccessOnPublicComputersEnabled             = $True;
            DisplayPhotosEnabled                                 = $True;
            Ensure                                               = "Present";
            ExplicitLogonEnabled                                 = $True;
            ExternalImageProxyEnabled                            = $True;
            ForceSaveAttachmentFilteringEnabled                  = $False;
            ForceSaveFileTypes                                   = @(".vsmacros",".ps2xml",".ps1xml",".mshxml",".gadget",".psc2",".psc1",".html",".aspx",".wsh",".wsf",".wsc",".vsw",".vst",".vss",".vbs",".vbe",".url",".tmp",".swf",".spl",".shs",".shb",".sct",".scr",".scf",".reg",".pst",".ps2",".ps1",".prg",".prf",".plg",".pif",".pcd",".ops",".mst",".msp",".msi",".msh",".msc",".mdz",".mdw",".mdt",".mde",".mdb",".mda",".maw",".mav",".mau",".mat",".mas",".mar",".maq",".mam",".mag",".maf",".mad",".lnk",".ksh",".jse",".its",".isp",".ins",".inf",".htm",".hta",".hlp",".fxp",".exe",".dir",".dcr",".csh",".crt",".cpl",".com",".cmd",".chm",".cer",".bat",".bas",".asx",".asp",".app",".adp",".ade",".ws",".vb",".js");
            ForceSaveMimeTypes                                   = @("Application/x-shockwave-flash","Application/octet-stream","Application/futuresplash","Application/x-director","text/html");
            ForceWacViewingFirstOnPrivateComputers               = $False;
            ForceWacViewingFirstOnPublicComputers                = $False;
            FreCardsEnabled                                      = $True;
            GlobalAddressListEnabled                             = $True;
            GroupCreationEnabled                                 = $True;
            InstantMessagingEnabled                              = $True;
            InstantMessagingType                                 = "Ocs";
            InterestingCalendarsEnabled                          = $True;
            IRMEnabled                                           = $True;
            IsDefault                                            = $True;
            JournalEnabled                                       = $True;
            LocalEventsEnabled                                   = $False;
            LogonAndErrorLanguage                                = 0;
            Name                                                 = "OwaMailboxPolicy-Default";
            NotesEnabled                                         = $True;
            NpsSurveysEnabled                                    = $True;
            OnSendAddinsEnabled                                  = $False;
            OrganizationEnabled                                  = $True;
            OutboundCharset                                      = "AutoDetect";
            OutlookBetaToggleEnabled                             = $True;
            OWALightEnabled                                      = $True;
            PersonalAccountCalendarsEnabled                      = $True;
            PhoneticSupportEnabled                               = $False;
            PlacesEnabled                                        = $True;
            PremiumClientEnabled                                 = $True;
            PrintWithoutDownloadEnabled                          = $True;
            PublicFoldersEnabled                                 = $True;
            RecoverDeletedItemsEnabled                           = $True;
            ReferenceAttachmentsEnabled                          = $True;
            RemindersAndNotificationsEnabled                     = $True;
            ReportJunkEmailEnabled                               = $True;
            RulesEnabled                                         = $True;
            SatisfactionEnabled                                  = $True;
            SaveAttachmentsToCloudEnabled                        = $True;
            SearchFoldersEnabled                                 = $True;
            SetPhotoEnabled                                      = $True;
            SetPhotoURL                                          = "";
            SignaturesEnabled                                    = $True;
            SkipCreateUnifiedGroupCustomSharepointClassification = $True;
            TeamSnapCalendarsEnabled                             = $True;
            TextMessagingEnabled                                 = $True;
            ThemeSelectionEnabled                                = $True;
            UMIntegrationEnabled                                 = $True;
            UseGB18030                                           = $False;
            UseISO885915                                         = $False;
            UserVoiceEnabled                                     = $True;
            WacEditingEnabled                                    = $True;
            WacExternalServicesEnabled                           = $True;
            WacOMEXEnabled                                       = $False;
            WacViewingOnPrivateComputersEnabled                  = $True;
            WacViewingOnPublicComputersEnabled                   = $True;
            WeatherEnabled                                       = $True;
            WebPartsFrameOptionsType                             = "SameOrigin";
        }
        EXOSafeAttachmentPolicy da2815b9-092b-43f9-905f-a81105eda818
        {
            Action               = "DynamicDelivery";
            ActionOnError        = $True;
            AdminDisplayName     = "";
            Credential           = $Credscredential;
            Enable               = $True;
            Ensure               = "Present";
            Identity             = "ATP";
            Redirect             = $True;
            RedirectAddress      = "secops@tccq.com.au";
        }
        EXOSafeAttachmentRule d76311f3-d3ee-47ad-9535-39ca34bf1a14
        {
            Credential           = $Credscredential;
            Enabled              = $True;
            Ensure               = "Present";
            Identity             = "ATP";
            Priority             = 0;
            RecipientDomainIs    = @("tccq.com.au","thecommunitycollectiveqld.com.au","$OrganizationName","youremployment.onmicrosoft.com");
            SafeAttachmentPolicy = "ATP";
        }
        EXOSharedMailbox c3ddbc7e-9363-4753-9f45-9bb1a5c5f3bf
        {
            Aliases              = @("secops@youremployment.onmicrosoft.com","secops@$OrganizationName");
            Credential           = $Credscredential;
            DisplayName          = "Security Operations";
            Ensure               = "Present";
            PrimarySMTPAddress   = "secops@tccq.com.au";
        }
        EXOSharingPolicy 4f460697-1fbe-4c44-a5a6-550067788dc3
        {
            Credential           = $Credscredential;
            Default              = $True;
            Domains              = @("Anonymous:CalendarSharingFreeBusyReviewer","*:CalendarSharingFreeBusySimple");
            Enabled              = $True;
            Ensure               = "Present";
            Name                 = "Default Sharing Policy";
        }
        EXOTransportRule f6aa5385-5a6f-4970-b22b-c8a340ffece7
        {
            ApplyHtmlDisclaimerFallbackAction         = "Wrap";
            ApplyHtmlDisclaimerLocation               = "Append";
            ApplyHtmlDisclaimerText                   = "<table border=0 cellspacing=0 cellpadding=0 align=left width=``"100%``">
<tr>
<td style='background:#bba555;padding:5.25pt 5.5pt 5.25pt 1.5pt'></td>
<td width=``"100%``" style='width:100.0%;background:#ffe599;padding:5.25pt 
3.75pt 5.25pt 11.25pt; word-wrap:break-word' cellpadding=``"7px 5px 7px
 15px``" color=``"#212121``">
<div><p><span style='font-size:11pt;font-family:Arial,sans-serif;color:
#212121'>
<b>CAUTION:</b> This email originated from outside the organization. 
Do not click links or open attachments unless you recognize the sender 
and know the content is safe.
</span></p></div>
</td></tr></table>";
            ApplyOME                                  = $False;
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            Comments                                  = "
";
            Credential                                = $Credscredential;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            FromScope                                 = "NotInOrganization";
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $False;
            Name                                      = "External Senders - Warning";
            Priority                                  = 0;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            StopRuleProcessing                        = $False;
        }
        EXOTransportRule bd20cba8-cae2-40a9-9cd1-f5fa3a066652
        {
            ApplyOME                                  = $False;
            AttachmentHasExecutableContent            = $False;
            AttachmentIsPasswordProtected             = $False;
            AttachmentIsUnsupported                   = $False;
            AttachmentProcessingLimitExceeded         = $False;
            Comments                                  = "
";
            Credential                                = $Credscredential;
            DeleteMessage                             = $False;
            Ensure                                    = "Present";
            ExceptIfAttachmentHasExecutableContent    = $False;
            ExceptIfAttachmentIsPasswordProtected     = $False;
            ExceptIfAttachmentIsUnsupported           = $False;
            ExceptIfAttachmentProcessingLimitExceeded = $False;
            ExceptIfHasNoClassification               = $False;
            ExceptIfHasSenderOverride                 = $False;
            FromScope                                 = "NotInOrganization";
            HasNoClassification                       = $False;
            HasSenderOverride                         = $False;
            Mode                                      = "Enforce";
            ModerateMessageByManager                  = $False;
            Name                                      = "Add X-MS-Exchange-EnableFirstContactSafetyTip to inbound";
            Priority                                  = 1;
            RemoveOME                                 = $False;
            RemoveOMEv2                               = $False;
            RouteMessageOutboundRequireTls            = $False;
            RuleErrorAction                           = "Ignore";
            RuleSubType                               = "None";
            SenderAddressLocation                     = "Header";
            SetHeaderName                             = "X-MS-Exchange-EnableFirstContactSafetyTip";
            SetHeaderValue                            = "True";
            StopRuleProcessing                        = $False;
        }
        O365AdminAuditLogConfig 4393702a-f290-4cbf-851a-79559dfa37f9
        {
            Credential                      = $Credscredential;
            Ensure                          = "Present";
            IsSingleInstance                = "Yes";
            UnifiedAuditLogIngestionEnabled = "Enabled";
        }
        O365OrgCustomizationSetting b4d3b0bf-2dde-4a3f-b7ea-208b19164f23
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsSingleInstance     = "Yes";
        }
        ODSettings 66a8367c-19d6-4ed3-b2b0-08509724e5e7
        {
            BlockMacSync                              = $False;
            Credential                                = $Credscredential;
            DisableReportProblemDialog                = $False;
            DomainGuids                               = @();
            Ensure                                    = "Present";
            ExcludedFileExtensions                    = @();
            IsSingleInstance                          = "Yes";
            NotificationsInOneDriveForBusinessEnabled = $True;
            NotifyOwnersWhenInvitationsAccepted       = $True;
            ODBAccessRequests                         = "Unspecified";
            ODBMembersCanShare                        = "Unspecified";
            OneDriveForGuestsEnabled                  = $False;
            OneDriveStorageQuota                      = 1048576;
            OrphanedPersonalSitesRetentionPeriod      = 30;
        }
        SCComplianceTag 878f17a8-f2dc-4bb0-b750-b1506f0b3770
        {
            Comment              = "This includes data such as, incident/accident information, potential legal action/fraud records, customer feedback register, risk assessments, other related documentation. This type of Record is retained for 6 after last edit unless held for litigation";
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsRecordLabel        = $True;
            Name                 = "Priority Record";
            Notes                = "This includes data such as, incident/accident information, potential legal action/fraud records, customer feedback register, risk assessments, other related documentation. This type of Record is retained for 6 after last edit unless held for litigation";
            Regulatory           = $False;
            RetentionAction      = "KeepAndDelete";
            RetentionDuration    = "2555";
            RetentionType        = "ModificationAgeInDays";
            ReviewerEmail        = @("sarah@$OrganizationName","brendon@$OrganizationName");
        }
        SCComplianceTag 6d536912-4c5c-4f7e-9757-602850b6c0c6
        {
            Comment              = "Documents can be modified and shared";
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsRecordLabel        = $False;
            Name                 = "General Services Documents";
            Notes                = "Documents can be modified and shared eg; resume";
            Regulatory           = $False;
            RetentionAction      = "KeepAndDelete";
            RetentionDuration    = "1095";
            RetentionType        = "ModificationAgeInDays";
            ReviewerEmail        = @("sarah@$OrganizationName","brendon@$OrganizationName");
        }
        SCComplianceTag bbf6ab36-1a65-41a9-a954-bdc29c367651
        {
            Comment              = "Records involving the provision of employment Services to Participants. However, if there is any indication that a Record may be required in relation to legal action, the Record must be re-categorised as a Priority Record and managed as per Priority Records documentation. General Services Records include Employment Pathway Plan, Activity agreements, Proposed NEIS business plans, Monitoring/mentoring information, Non-work experience placement/service, services and support provided to the participant, criminal records checks and other background checks, other related documentations. This type of Record must be destroyed after 3 years of the last action.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            IsRecordLabel        = $True;
            Name                 = "General Services Records";
            Notes                = "Records involving the provision of employment Services to Participants. However, if there is any indication that a Record may be required in relation to legal action, the Record must be re-categorised as a Priority Record and managed as per Priority Records documentation. General Services Records include Employment Pathway Plan, Activity agreements, Proposed NEIS business plans, Monitoring/mentoring information, Non-work experience placement/service, services and support provided to the participant, criminal records checks and other background checks, other related documentations. This type of Record must be destroyed after 3 years of the last action.";
            Regulatory           = $False;
            RetentionAction      = "KeepAndDelete";
            RetentionDuration    = "1095";
            RetentionType        = "ModificationAgeInDays";
            ReviewerEmail        = @("brendon@$OrganizationName","sarah@$OrganizationName");
        }
        SCFilePlanPropertyAuthority f0238614-2ba7-416a-87f6-41026388fdde
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Business";
        }
        SCFilePlanPropertyAuthority e5727927-162b-4038-a7d2-b15ba6e8c89a
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal";
        }
        SCFilePlanPropertyAuthority 507a66a7-74d4-47af-acc2-bf9fd0a8f456
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Regulatory";
        }
        SCFilePlanPropertyCategory 1fd7df4c-f669-4985-a928-e87285b79051
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Accounts payable";
        }
        SCFilePlanPropertyCategory 48152410-a95c-4335-98f7-ee19a653c107
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Accounts receivable";
        }
        SCFilePlanPropertyCategory 1a28e2fc-2c1b-47b7-8d04-4bb4fcfaa3e6
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Administration";
        }
        SCFilePlanPropertyCategory be7754b3-cc8e-4999-8404-6bb1910cf670
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Compliance";
        }
        SCFilePlanPropertyCategory b838072d-1e4f-421f-bfc2-59fbf6205400
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Contracting";
        }
        SCFilePlanPropertyCategory 83521afd-cac1-47f7-ad86-88499fdbfa3b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Financial statements";
        }
        SCFilePlanPropertyCategory 2dba050b-5583-4ff7-9ffd-34971265a008
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Learning and development";
        }
        SCFilePlanPropertyCategory 12173877-cc4b-4bbb-ba8e-7ed151623f36
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Planning";
        }
        SCFilePlanPropertyCategory eb714bbe-6659-4672-b86d-57e536143625
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Payroll";
        }
        SCFilePlanPropertyCategory 729f41c9-fd08-4b97-baaa-9eb9c0d10597
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Policies and procedures";
        }
        SCFilePlanPropertyCategory f7fdaa59-d5b4-406d-ad2d-220ac9fb6d24
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Procurement";
        }
        SCFilePlanPropertyCategory fe051622-9773-4054-998b-631a55521808
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Recruiting and hiring";
        }
        SCFilePlanPropertyCategory 17bcf5f3-10ee-4b6f-b4d4-9530b57d8e4e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Research and development";
        }
        SCFilePlanPropertyCitation 27afdc75-ab5b-4e90-bb3e-3adafdd4df9d
        {
            CitationJurisdiction = "U.S. Futures Commodity Trading Commission (UCFTC)";
            CitationUrl          = "https://www.cftc.gov/LawRegulation/CommodityExchangeAct/index.htm";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Commodity Exchange Act";
        }
        SCFilePlanPropertyCitation f6daba69-35b4-4ff3-9cfe-3da8649a713e
        {
            CitationJurisdiction = "U.S. Securities and Exchange Commission (SEC)";
            CitationUrl          = "https://www.sec.gov/answers/about-lawsshtml.html#sox2002";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Sarbanes-Oxley Act of 2002";
        }
        SCFilePlanPropertyCitation 73fdc40f-888a-4903-a5f7-31825a1dd6d2
        {
            CitationJurisdiction = "Federal Trade Commission (FTC)";
            CitationUrl          = "https://www.ftc.gov/enforcement/statutes/truth-lending-act";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Truth in lending Act";
        }
        SCFilePlanPropertyCitation 4c0f40b7-b910-41fe-913e-cb549308e772
        {
            CitationJurisdiction = "U.S. Department of Health & Human Services (HHS)";
            CitationUrl          = "https://aspe.hhs.gov/report/health-insurance-portability-and-accountability-act-1996";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Health Insurance Portability and Accountability Act of 1996";
        }
        SCFilePlanPropertyCitation 9d56ca97-6966-45dc-a9a1-f8a54f41f724
        {
            CitationJurisdiction = "U.S. Department of Labor (DOL)";
            CitationUrl          = "https://www.osha.gov/recordkeeping/index.html";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "OSHA Injury and Illness Recordkeeping and Reporting Requirements";
        }
        SCFilePlanPropertyDepartment 0e918573-a697-45bc-8d02-2136ad947975
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Finance";
        }
        SCFilePlanPropertyDepartment fa803da8-b560-4a59-be0f-fc2990418c36
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Human resources";
        }
        SCFilePlanPropertyDepartment e523e0f0-8663-4b9b-9f08-cec2476814c4
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Information technology";
        }
        SCFilePlanPropertyDepartment f1614647-311f-4ba4-a636-3a4c5fa5c42e
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Legal";
        }
        SCFilePlanPropertyDepartment 5ecd82d0-502d-42d9-bb80-0f8abf27590b
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Marketing";
        }
        SCFilePlanPropertyDepartment 5f58b626-1a66-4be9-9133-7240860d3ea9
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Operations";
        }
        SCFilePlanPropertyDepartment 01ea7b05-5daf-43a1-ae39-fa5e3215c1d1
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Procurement";
        }
        SCFilePlanPropertyDepartment f1077637-c6fe-4a43-af5b-26351a73a490
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Products";
        }
        SCFilePlanPropertyDepartment 00c29227-338f-44f3-bd3d-a5dea0233dd0
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Sales";
        }
        SCFilePlanPropertyDepartment fe0f552c-c040-4ac1-a8e3-2d38c6e071f2
        {
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Services";
        }
        SCLabelPolicy 51473e44-350c-4b16-8c53-98b8ad3ac998
        {
            AdvancedSettings     = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'requiredowngradejustification'
                    Value = 'true'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'mandatory'
                    Value = 'false'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'defaultlabelid'
                    Value = '916c563d-c471-4a98-8d36-69c220ee6d85'
                }
            );
            Comment              = "";
            Credential           = $Credscredential;
            Ensure               = "Present";
            ExchangeLocation     = "All";
            Labels               = @("Highly Confidential All Employees","Confidential All Employees","Highly Confidential Recipients Only","Highly Confidential","General","Public","Confidential Recipients Only","Confidential","Confidential Anyone","Highly Confidential Anyone","Personal");
            Name                 = "All Policies";
        }
        SCRetentionCompliancePolicy 39136148-e0c7-4377-b1ec-e825b7a8e8f6
        {
            Comment                      = "";
            Credential                   = $Credscredential;
            Enabled                      = $True;
            Ensure                       = "Present";
            ExchangeLocation             = @();
            ExchangeLocationException    = @();
            ModernGroupLocation          = @();
            ModernGroupLocationException = @();
            Name                         = "Standard Policies - Labels";
            OneDriveLocation             = @();
            OneDriveLocationException    = @();
            PublicFolderLocation         = @();
            RestrictiveRetention         = $False;
            SharePointLocation           = @();
            SharePointLocationException  = @();
            SkypeLocation                = @();
            SkypeLocationException       = @();
        }
        SCRetentionComplianceRule f8f4ca78-88c6-4928-a9ec-ecc2658bfa3a
        {
            Comment                      = "";
            ContentMatchQuery            = "";
            Credential                   = $Credscredential;
            Ensure                       = "Present";
            ExcludedItemClasses          = @();
            Name                         = "ctptr-01c162b9-4178-4676-878b-5dca4dbed338";
            Policy                       = "Standard Policies - Labels";
            RetentionComplianceAction    = "KeepAndDelete";
            RetentionDurationDisplayHint = "Days";
        }
        SCRetentionComplianceRule 4edbcdae-4c2f-4d9d-8d8a-17df88cc24b4
        {
            Comment                      = "";
            ContentMatchQuery            = "";
            Credential                   = $Credscredential;
            Ensure                       = "Present";
            ExcludedItemClasses          = @();
            Name                         = "ctptr-5aaa8fb4-d6f1-4a72-96e3-0e2e9dea72ab";
            Policy                       = "Standard Policies - Labels";
            RetentionComplianceAction    = "KeepAndDelete";
            RetentionDurationDisplayHint = "Days";
        }
        SCRetentionComplianceRule e7654f62-c65c-40a5-b266-58cdbffa5ad5
        {
            Comment                      = "";
            ContentMatchQuery            = "";
            Credential                   = $Credscredential;
            Ensure                       = "Present";
            ExcludedItemClasses          = @();
            Name                         = "ctptr-b838a5aa-b670-4313-afd4-d909a498a3cf";
            Policy                       = "Standard Policies - Labels";
            RetentionComplianceAction    = "KeepAndDelete";
            RetentionDurationDisplayHint = "Days";
        }
        SCRetentionEventType 5d5e8b17-bcd9-4cfd-92b8-a51e73be3df9
        {
            Comment              = "Processes related to hiring, performance and termination of an employee.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Employee activity";
        }
        SCRetentionEventType e5e7f72d-99ce-48f8-a89b-11d9364721d8
        {
            Comment              = "Expiration or termination of various executed contracts and agreements such as business contracts, leases, license agreements and contingent staff agreements.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Expiration or termination of contracts and agreements";
        }
        SCRetentionEventType 5a035f66-111c-450f-b546-93f2b7249799
        {
            Comment              = "Processes related to last manufacturing date of products.";
            Credential           = $Credscredential;
            Ensure               = "Present";
            Name                 = "Product lifetime";
        }
        SCSensitivityLabel 7924ed96-6af3-4b87-a9b0-8c976baeba9b
        {
            AdvancedSettings            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = '69f1b668-dde1-4e46-9096-c568857ddb68'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = '#737373'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Non-business data  for personal use only.'
                }
            );
            Comment                     = "";
            Credential                  = $Credscredential;
            Disabled                    = $False;
            DisplayName                 = "Personal";
            EncryptionAipTemplateScopes = "[]";
            EncryptionEnabled           = $False;
            EncryptionProtectionType    = "Template";
            Ensure                      = "Present";
            LocaleSettings              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Personal'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Non-business data, for personal use only.'
                        }
                    )
                }
            );
            Name                        = "Personal";
            Priority                    = 0;
            Tooltip                     = "Non-business data, for personal use only.";
        }
        SCSensitivityLabel 41242d18-0a23-4f7a-a120-04bfa6583187
        {
            AdvancedSettings            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = '2df44285-4f78-4eeb-9636-52602c1d4c41'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = '#317100'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Business data that is specifically prepared and approved for public consumption.'
                }
            );
            Comment                     = "";
            Credential                  = $Credscredential;
            Disabled                    = $False;
            DisplayName                 = "Public";
            EncryptionAipTemplateScopes = "[]";
            EncryptionEnabled           = $False;
            EncryptionProtectionType    = "Template";
            Ensure                      = "Present";
            LocaleSettings              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Public'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Business data that is specifically prepared and approved for public consumption.'
                        }
                    )
                }
            );
            Name                        = "Public";
            Priority                    = 1;
            Tooltip                     = "Business data that is specifically prepared and approved for public consumption.";
        }
        SCSensitivityLabel 3ac15e7e-12e9-43a8-a962-b265e1d402b2
        {
            AdvancedSettings            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = '9c02b3db-e797-47e3-bdf5-a3589dd1d633'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = '#0078D7'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Business data that is not intended for public consumption. However  this can be shared with external partners  as required. Examples include a company internal telephone directory  organizational charts  internal standards  and most internal communication.'
                }
            );
            Comment                     = "";
            Credential                  = $Credscredential;
            Disabled                    = $False;
            DisplayName                 = "General";
            EncryptionAipTemplateScopes = "[]";
            EncryptionEnabled           = $False;
            EncryptionProtectionType    = "Template";
            Ensure                      = "Present";
            LocaleSettings              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'General'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.'
                        }
                    )
                }
            );
            Name                        = "General";
            Priority                    = 2;
            Tooltip                     = "Business data that is not intended for public consumption. However, this can be shared with external partners, as required. Examples include a company internal telephone directory, organizational charts, internal standards, and most internal communication.";
        }
        SCSensitivityLabel 885faa26-2437-46ac-bed6-0c90e1236be3
        {
            AdvancedSettings            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'f01c74ef-00dc-4d80-80ad-bce040c609ee'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = '#FF8C00'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts  security reports  forecast summaries  and sales account data.'
                }
            );
            Comment                     = "";
            Credential                  = $Credscredential;
            Disabled                    = $False;
            DisplayName                 = "Confidential";
            EncryptionAipTemplateScopes = "[]";
            EncryptionEnabled           = $False;
            EncryptionProtectionType    = "Template";
            Ensure                      = "Present";
            LocaleSettings              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.'
                        }
                    )
                }
            );
            Name                        = "Confidential";
            Priority                    = 3;
            Tooltip                     = "Sensitive business data that could cause damage to the business if shared with unauthorized people. Examples include contracts, security reports, forecast summaries, and sales account data.";
        }
        SCSensitivityLabel 2f694dec-75f9-4d7a-b7db-b107eccfa2bf
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'f36a5ac7-7f9a-4c73-8982-354ea30d0d63'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = '0b04d007-ba52-42d0-88f5-222dfa59ed3f'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Confidential data that requires protection and that can be viewed by the recipients only.'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = 8;
            ApplyContentMarkingFooterMargin    = 15;
            ApplyContentMarkingFooterText      = "Classified as Confidential";
            Comment                            = "";
            Credential                         = $Credscredential;
            Disabled                           = $False;
            DisplayName                        = "Recipients Only";
            EncryptionDoNotForward             = $True;
            EncryptionEnabled                  = $True;
            EncryptionPromptUser               = $False;
            EncryptionProtectionType           = "UserDefined";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Recipients Only'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential data that requires protection and that can be viewed by the recipients only.'
                        }
                    )
                }
            );
            Name                               = "Confidential Recipients Only";
            ParentId                           = "Confidential";
            Priority                           = 4;
            Tooltip                            = "Confidential data that requires protection and that can be viewed by the recipients only.";
        }
        SCSensitivityLabel ef426c46-486c-4c14-a4aa-8b6a406550a5
        {
            AdvancedSettings                            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = '2a0d541d-49a5-40ff-84b1-af0f8909f811'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = '0b04d007-ba52-42d0-88f5-222dfa59ed3f'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Confidential data that requires protection  which allows all employees full permissions. Data owners can track and revoke content.'
                }
            );
            ApplyContentMarkingFooterAlignment          = "Left";
            ApplyContentMarkingFooterEnabled            = $True;
            ApplyContentMarkingFooterFontColor          = "#000000";
            ApplyContentMarkingFooterFontSize           = 8;
            ApplyContentMarkingFooterMargin             = 15;
            ApplyContentMarkingFooterText               = "Classified as Confidential";
            Comment                                     = "";
            Credential                                  = $Credscredential;
            Disabled                                    = $False;
            DisplayName                                 = "All Employees";
            EncryptionAipTemplateScopes                 = "[]";
            EncryptionContentExpiredOnDateInDaysOrNever = "Never";
            EncryptionEnabled                           = $True;
            EncryptionOfflineAccessDays                 = 30;
            EncryptionProtectionType                    = "Template";
            EncryptionRightsDefinitions                 = "youremployment.onmicrosoft.com:VIEW,VIEWRIGHTSDATA,DOCEDIT,EDIT,PRINT,EXTRACT,REPLY,REPLYALL,FORWARD,EXPORT,EDITRIGHTSDATA,OBJMODEL,OWNER";
            Ensure                                      = "Present";
            LocaleSettings                              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'All Employees'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.'
                        }
                    )
                }
            );
            Name                                        = "Confidential All Employees";
            ParentId                                    = "Confidential";
            Priority                                    = 5;
            Tooltip                                     = "Confidential data that requires protection, which allows all employees full permissions. Data owners can track and revoke content.";
        }
        SCSensitivityLabel 5afc7709-0472-44a4-a4ff-10ce40716901
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'c9dc0b76-5160-4906-aeca-4ee517c6ee06'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = '0b04d007-ba52-42d0-88f5-222dfa59ed3f'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Data that does not require protection. Use this option with care and with appropriate business justification.'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = 8;
            ApplyContentMarkingFooterMargin    = 15;
            ApplyContentMarkingFooterText      = "Classified as Confidential";
            Comment                            = "";
            Credential                         = $Credscredential;
            Disabled                           = $False;
            DisplayName                        = "Anyone (not protected)";
            EncryptionAipTemplateScopes        = "[]";
            EncryptionEnabled                  = $False;
            EncryptionProtectionType           = "Template";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Anyone (not protected)'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Data that does not require protection. Use this option with care and with appropriate business justification.'
                        }
                    )
                }
            );
            Name                               = "Confidential Anyone";
            ParentId                           = "Confidential";
            Priority                           = 6;
            Tooltip                            = "Data that does not require protection. Use this option with care and with appropriate business justification.";
        }
        SCSensitivityLabel 1412b1b7-78cb-427e-a1fc-620a9616fb92
        {
            AdvancedSettings            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'dd94f473-79e7-489c-9f85-dee5703c4de8'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = '#A80000'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information  passwords  source code  and pre-announced financial reports.'
                }
            );
            Comment                     = "";
            Credential                  = $Credscredential;
            Disabled                    = $False;
            DisplayName                 = "Highly Confidential";
            EncryptionAipTemplateScopes = "[]";
            EncryptionEnabled           = $False;
            EncryptionProtectionType    = "Template";
            Ensure                      = "Present";
            LocaleSettings              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly Confidential'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.'
                        }
                    )
                }
            );
            Name                        = "Highly Confidential";
            Priority                    = 7;
            Tooltip                     = "Very sensitive business data that would cause damage to the business if it was shared with unauthorized people. Examples include employee and customer information, passwords, source code, and pre-announced financial reports.";
        }
        SCSensitivityLabel e4a359a5-8a9a-4c24-90e0-26f45cfaad3e
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'a652516b-f4a0-471d-bb0b-9a1d908be85e'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'aeacdd6f-aee2-445e-b863-b17d350bdba7'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Highly Confidential data that requires protection and that can be viewed by the recipients only.'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = 8;
            ApplyContentMarkingFooterMargin    = 15;
            ApplyContentMarkingFooterText      = "Classified as Highly Confidential";
            Comment                            = "";
            Credential                         = $Credscredential;
            Disabled                           = $False;
            DisplayName                        = "Recipients Only";
            EncryptionDoNotForward             = $True;
            EncryptionEnabled                  = $True;
            EncryptionPromptUser               = $False;
            EncryptionProtectionType           = "UserDefined";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Recipients Only'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly Confidential data that requires protection and that can be viewed by the recipients only.'
                        }
                    )
                }
            );
            Name                               = "Highly Confidential Recipients Only";
            ParentId                           = "Highly Confidential";
            Priority                           = 8;
            Tooltip                            = "Highly Confidential data that requires protection and that can be viewed by the recipients only.";
        }
        SCSensitivityLabel 4fbe57cf-ceae-44bc-a826-c1f85abf6142
        {
            AdvancedSettings                            = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = 'd6b5936a-f8cb-4a08-afd1-eac76e6e8d76'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'aeacdd6f-aee2-445e-b863-b17d350bdba7'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Highly confidential data that allows all employees view  edit  and reply permissions to this content. Data owners can track and revoke content.'
                }
            );
            ApplyContentMarkingFooterAlignment          = "Left";
            ApplyContentMarkingFooterEnabled            = $True;
            ApplyContentMarkingFooterFontColor          = "#000000";
            ApplyContentMarkingFooterFontSize           = 8;
            ApplyContentMarkingFooterMargin             = 15;
            ApplyContentMarkingFooterText               = "Classified as Highly Confidential";
            Comment                                     = "";
            Credential                                  = $Credscredential;
            Disabled                                    = $False;
            DisplayName                                 = "All Employees";
            EncryptionAipTemplateScopes                 = "[]";
            EncryptionContentExpiredOnDateInDaysOrNever = "Never";
            EncryptionEnabled                           = $True;
            EncryptionOfflineAccessDays                 = 30;
            EncryptionProtectionType                    = "Template";
            EncryptionRightsDefinitions                 = "youremployment.onmicrosoft.com:VIEW,VIEWRIGHTSDATA,DOCEDIT,EDIT,PRINT,EXTRACT,REPLY,REPLYALL,FORWARD,OBJMODEL";
            Ensure                                      = "Present";
            LocaleSettings                              = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'All Employees'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.'
                        }
                    )
                }
            );
            Name                                        = "Highly Confidential All Employees";
            ParentId                                    = "Highly Confidential";
            Priority                                    = 9;
            Tooltip                                     = "Highly confidential data that allows all employees view, edit, and reply permissions to this content. Data owners can track and revoke content.";
        }
        SCSensitivityLabel d0b1a0d3-b1dc-4d49-977c-e85aa31e2ba3
        {
            AdvancedSettings                   = @(
                MSFT_SCLabelSetting
                {
                    Key   = 'aiplabelversion'
                    Value = '73a36600-ea3f-4541-934f-e9b4367c88db'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'color'
                    Value = ''
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'parentid'
                    Value = 'aeacdd6f-aee2-445e-b863-b17d350bdba7'
                }
                MSFT_SCLabelSetting
                {
                    Key   = 'tooltip'
                    Value = 'Data that does not require protection. Use this option with care and with appropriate business justification.'
                }
            );
            ApplyContentMarkingFooterAlignment = "Left";
            ApplyContentMarkingFooterEnabled   = $True;
            ApplyContentMarkingFooterFontColor = "#000000";
            ApplyContentMarkingFooterFontSize  = 8;
            ApplyContentMarkingFooterMargin    = 15;
            ApplyContentMarkingFooterText      = "Classified as Highly Confidential";
            Comment                            = "";
            Credential                         = $Credscredential;
            Disabled                           = $False;
            DisplayName                        = "Anyone (not protected)";
            EncryptionAipTemplateScopes        = "[]";
            EncryptionEnabled                  = $False;
            EncryptionProtectionType           = "Template";
            Ensure                             = "Present";
            LocaleSettings                     = @(
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'displayName'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Anyone (not protected)'
                        }
                    )
                }
                MSFT_SCLabelLocaleSettings
                {
                    LocaleKey = 'tooltip'
                    Settings  = @(
                        MSFT_SCLabelSetting
                        {
                            Key   = 'default'
                            Value = 'Data that does not require protection. Use this option with care and with appropriate business justification.'
                        }
                    )
                }
            );
            Name                               = "Highly Confidential Anyone";
            ParentId                           = "Highly Confidential";
            Priority                           = 10;
            Tooltip                            = "Data that does not require protection. Use this option with care and with appropriate business justification.";
        }
        SPOAccessControlSettings e8fb01b1-2fa1-4c47-8eca-afdc9b33ee41
        {
            CommentsOnSitePagesDisabled  = $False;
            Credential                   = $Credscredential;
            DisallowInfectedFileDownload = $False;
            DisplayStartASiteOption      = $True;
            EmailAttestationReAuthDays   = 30;
            EmailAttestationRequired     = $False;
            ExternalServicesEnabled      = $True;
            IPAddressAllowList           = "";
            IPAddressEnforcement         = $False;
            IPAddressWACTokenLifetime    = 15;
            IsSingleInstance             = "Yes";
            SocialBarOnSitePagesDisabled = $False;
        }
        SPOBrowserIdleSignout 0037c26c-cea7-485d-bbc0-208a3be2aa5d
        {
            Credential           = $Credscredential;
            Enabled              = $False;
            IsSingleInstance     = "Yes";
            SignOutAfter         = "00:00:00";
            WarnAfter            = "00:00:00";
        }
         SPOSharingSettings 38cbbef5-10c2-4f3d-81c1-733983a5f1a4
        {
            BccExternalSharingInvitations              = $False;
            Credential                                 = $Credscredential;
            DefaultLinkPermission                      = "None";
            DefaultSharingLinkType                     = "AnonymousAccess";
            EnableGuestSignInAcceleration              = $False;
            FileAnonymousLinkType                      = "Edit";
            FolderAnonymousLinkType                    = "Edit";
            IsSingleInstance                           = "Yes";
            NotifyOwnersWhenItemsReshared              = $True;
            PreventExternalUsersFromResharing          = $False;
            ProvisionSharedWithEveryoneFolder          = $False;
            RequireAcceptingAccountMatchInvitedAccount = $False;
            RequireAnonymousLinksExpireInDays          = 30;
            SharingCapability                          = "ExternalUserAndGuestSharing";
            SharingDomainRestrictionMode               = "None";
            ShowAllUsersClaim                          = $False;
            ShowEveryoneClaim                          = $False;
            ShowEveryoneExceptExternalUsersClaim       = $True;
            ShowPeoplePickerSuggestionsForGuestUsers   = $False;
        }
     }
}
M365TenantConfig -ConfigurationData .\ConfigurationData.psd1 -Credential $Credential
