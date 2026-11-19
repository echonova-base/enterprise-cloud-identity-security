# Entra Sensitive Group Membership Detection

## Objective

Detect successful additions of users to the sensitive Entra ID group:

`NBG-IT-Administrators`

Unexpected membership changes to administrative groups may indicate persistence or privilege escalation.

## Data Source

Microsoft Entra ID Audit Logs

Telemetry path:

`Microsoft Entra ID -> Diagnostic Settings -> Log Analytics -> Microsoft Sentinel`

The Entra diagnostic setting forwards `AuditLogs` to the existing Log Analytics workspace:

`law-nbg-soc-lab`

## Controlled Test

A controlled lab test was performed by adding a normal lab user to:

`NBG-IT-Administrators`

The resulting Entra audit event contained:

- Activity: `Add member to group`
- Result: `success`
- initiating administrator
- added user
- target group
- group object ID

## KQL Detection

```kusto
AuditLogs
| where ActivityDisplayName == "Add member to group"
| where Result =~ "success"
| extend InitiatingUser = tostring(InitiatedBy.user.userPrincipalName)
| mv-expand TargetResource = TargetResources
| where tostring(TargetResource.type) == "User"
| extend AddedUser = tostring(TargetResource.userPrincipalName)
| mv-expand ModifiedProperty = TargetResource.modifiedProperties
| extend PropertyName = tostring(ModifiedProperty.displayName),
         NewValue = replace_string(tostring(ModifiedProperty.newValue), '"', '')
| summarize
    GroupName = anyif(NewValue, PropertyName == "Group.DisplayName"),
    GroupObjectId = anyif(NewValue, PropertyName == "Group.ObjectID")
    by TimeGenerated, InitiatingUser, AddedUser, Result
| where GroupName == "NBG-IT-Administrators"
| order by TimeGenerated desc
```

## Detection Logic

The query:

1. selects successful `Add member to group` audit events
2. extracts the initiating administrator
3. expands the target resource information
4. identifies the added user
5. parses the modified properties
6. extracts the affected group name and object ID
7. filters specifically for `NBG-IT-Administrators`

This reduces noise from unrelated group-management activity.

## Sentinel Analytics Rule

**Name:** `User Added to Sensitive IT Administrators Group`

**Severity:** Medium

**MITRE ATT&CK:** T1098 - Account Manipulation

**Tactic:** Persistence

**Query frequency:** 5 minutes

**Lookup period:** 5 minutes

**Alert threshold:** Greater than 0

**Incident creation:** Enabled

**Alert grouping:** Disabled

## Validation

A fresh controlled test was performed after the analytics rule was enabled.

Olivia Bennett was intentionally added to `NBG-IT-Administrators`.

The event was successfully:

`Entra ID -> AuditLogs -> Log Analytics -> KQL -> Sentinel analytics rule -> Microsoft Defender alert`

The generated alert contained:

- added user
- sensitive group name
- initiating administrator
- successful result

The alert was reviewed and classified as expected security testing.

## Detection Considerations

Not every administrative-group membership change is malicious.

Legitimate causes may include:

- approved access changes
- administrator onboarding
- role changes
- temporary operational requirements

An analyst should validate:

- who initiated the change
- which user was added
- whether the group is sensitive
- whether the change was authorized
- whether related identity or endpoint activity appears suspicious

## Evidence

- `14_Evidence/Entra_Sensitive_Group_Membership_KQL.png`
- `14_Evidence/Entra_Sensitive_Group_Membership_Alert.png`

## Validated Workflow

`Entra group membership change -> AuditLogs -> Log Analytics -> KQL detection -> Sentinel alert -> Analyst investigation -> Disposition`