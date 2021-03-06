# EXOAvailabilityConfig

## Description

This resource configures the Availability Config in Exchange Online.

## Parameters

Ensure

- Required: No (Defaults to 'Present')
- Description: Specifies whether the configured AvailabilityConfig
  should be Present or Absent.

Credential

- Required: Yes
- Description: Credentials of the account to authenticate with

OrgWideAccount

- Required: Yes
- Description: The OrgWideAccount parameter specifies an account or security group that has permission to issue proxy Availability service requests on an organization-wide basis.

## Example

```PowerShell
EXOAvailabilityConfig ExampleAvailabilityConfig {
    Ensure              = 'Present'
    OrgWideAccount      = 'johndoe'
    Credential          = $Credential
}
```
