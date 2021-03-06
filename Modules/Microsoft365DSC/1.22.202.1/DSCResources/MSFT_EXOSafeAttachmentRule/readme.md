# EXOSafeAttachmentRule

## Description

This resource configures an Safe Attachment Rule in Exchange Online.

## Parameters

SafeAttachmentPolicy

- Required: Yes
- Description: The Identity of the SafeAttachment Policy to associate
  with this SafeAttachment Rule.

Ensure

- Required: No (Defaults to 'Present')
- Description: Specifies if the configuration should be
  `Present` or `Absent`

Credential

- Required: Yes
- Description: Credentials of the account to authenticate with

Identity

- Required: Yes
- Description: Name of the Safe Attachment Rule

## Example

```PowerShell
        EXOSafeAttachmentRule TestSafeAttachmentRule {
            Ensure = 'Present'
            Identity = 'TestRule'
            Credential = $Credential
            SafeAttachmentPolicy = 'TestPolicy'
            Enabled = $true
            Priority = 0
            RecipientDomainIs = @('contoso.com')
        }
```
