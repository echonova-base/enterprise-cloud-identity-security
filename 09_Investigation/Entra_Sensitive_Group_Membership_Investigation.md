# Entra Sensitive Group Membership Investigation

## Alert

`User Added to Sensitive IT Administrators Group`

Severity: Medium

## Investigation Objective

Determine whether a user being added to `NBG-IT-Administrators` represents an authorized administrative change, expected security testing, or suspicious account manipulation.

## Alert Context

The validated alert contained:

- Added user: `olivia.bennett@northbridgegrouplab.onmicrosoft.com`
- Sensitive group: `NBG-IT-Administrators`
- Initiating user: `admin@northbridgegrouplab.onmicrosoft.com`
- Result: `success`

MITRE ATT&CK:

**T1098 - Account Manipulation**

Tactic:

**Persistence**

## Initial Triage

Review:

- initiating account
- added user
- affected group
- timestamp
- result
- whether the group is privileged or sensitive
- whether the change was authorized
- related identity activity

## Analyst Assessment

The event was generated intentionally as part of a controlled lab validation.

Olivia Bennett was deliberately added to `NBG-IT-Administrators` after the Sentinel analytics rule was enabled.

The observed activity matched the expected test:

`Administrator -> Add user -> Sensitive Entra group -> AuditLogs -> Sentinel alert`

No evidence of unauthorized activity was identified.

## Disposition

Classification:

`Informational, expected activity - Security testing`

Status:

`Resolved`

## Investigation Considerations

If this activity were unexpected in a production environment, an analyst should investigate:

- whether the initiating administrator account is legitimate
- whether the administrator's authentication activity is suspicious
- whether the added user requires membership in the group
- whether the change matches an approved request
- whether additional users were added to sensitive groups
- whether other identity or endpoint activity occurred around the same time

If unauthorized, potential response actions could include:

- remove the user from the sensitive group
- review the initiating administrator account
- revoke active sessions if compromise is suspected
- reset credentials or strengthen authentication controls if necessary
- review related audit events for additional account manipulation

## Evidence

- `14_Evidence/Entra_Sensitive_Group_Membership_KQL.png`
- `14_Evidence/Entra_Sensitive_Group_Membership_Alert.png`

## Investigation Outcome

The detection successfully identified a controlled sensitive-group membership change and provided sufficient context to determine:

- who performed the change
- which account was affected
- which administrative group was modified
- whether the operation succeeded

The activity was confirmed as expected security testing and the alert was resolved.