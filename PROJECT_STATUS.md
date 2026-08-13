\# North Bridge Group — Project Status



\## Project Purpose



Build a simulated enterprise Microsoft security operations environment to

practice and demonstrate identity security, endpoint telemetry, detection

engineering, threat hunting, incident investigation, and incident response.



\---



\## Current Phase



\*\*Phase: Architecture and Telemetry Preparation\*\*



The project architecture and initial attack scenarios have been designed.



Live implementation is temporarily limited by the need for a separately

controlled Microsoft Entra tenant.



\---



\## Environment Status



\### Existing Azure Environment



An Azure for Students subscription was activated using the McGill-associated

environment.



Resources created:



\- Azure resource group

\- Log Analytics workspace

\- Microsoft Sentinel

\- Sentinel free trial activated



Important constraint:



The associated McGill Entra directory does not provide the administrative

control required for the planned identity-security scenarios.



No additional tenant-dependent infrastructure should be deployed there until

the final tenant architecture is confirmed.



\### Planned North Bridge Group Environment



A separate Microsoft 365 Business Premium trial signup was initiated for the

North Bridge Group simulated organization.



Purpose:



\- Controlled Microsoft Entra tenant

\- Administrative access

\- Test identities and groups

\- MFA

\- Conditional Access

\- Identity-security telemetry

\- Security operations scenarios



Current blocker:



Business Premium signup reached payment verification. Activation has not yet

been completed.



The exact final onmicrosoft.com tenant domain must be verified after activation.



\---



\## Completed Project Work



\### Project Infrastructure



\- Local Git repository configured

\- GitHub repository connected

\- Repository folder structure created

\- Folder numbering standardized

\- `.gitignore` added for temporary/editor files



\### Architecture



Created:



\- `02\_Architecture/Target\_Architecture.md`

\- `02\_Architecture/Enterprise\_Identity\_Design.md`

\- `02\_Architecture/Telemetry\_Detection\_Matrix.md`



\### Attack Simulation Design



Created:



\- `04\_Attack\_Scenarios/Attack\_Scenario\_Plan.md`



Planned scenarios:



1\. Repeated authentication failures followed by successful authentication

2\. Suspicious PowerShell execution

3\. Privileged role/group modification

4\. Endpoint persistence



\### KQL



Created:



\- `06\_KQL\_Hunting/Suspicious\_PowerShell.kql`



Status:



\*\*Draft — not yet validated against live telemetry.\*\*



\### Sysmon



Created:



\- `05\_Data\_Collection/Sysmon/README.md`

\- `05\_Data\_Collection/Sysmon/sysmonconfig.xml`

\- `05\_Data\_Collection/Sysmon/Validation\_Checklist.md`



Initial telemetry requirements include:



\- Process creation

\- Network connections

\- File creation

\- Registry modifications



Relevant Sysmon events currently planned:



\- Event ID 1 — Process Creation

\- Event ID 3 — Network Connection

\- Event ID 11 — File Create

\- Event ID 13 — Registry Value Set



Sysmon configuration status:



\*\*Draft — must be validated against the actual Sysmon version and endpoint.\*\*



\---



\## Target Telemetry Pipeline



Windows Endpoint

→ Windows / Sysmon Telemetry

→ Azure Monitor Agent

→ Data Collection Rule

→ Log Analytics

→ Microsoft Sentinel

→ KQL

→ Analytics Rule

→ Alert / Incident

→ Investigation

→ Response



\---



\## Important Project Principles



\- North Bridge Group is a simulated organization.

\- Do not perform attack simulations against McGill or third-party systems.

\- Do not claim draft configurations or queries are validated until tested.

\- Separate privileged administrative identities from standard user identities.

\- Preserve reusable technical artifacts in GitHub.

\- Prefer hands-on validation over documentation-only progress.



\---



\## Current Technical Blocker



The controlled North Bridge Group Microsoft Entra tenant is not yet active.



Do not expand tenant-dependent implementation in the McGill directory simply

to continue making progress.



\---



\## Next Major Steps



1\. Complete North Bridge Group tenant activation.

2\. Verify the exact tenant domain and administrator identity.

3\. Determine the relationship between the existing Azure for Students

&#x20;  subscription and the controlled North Bridge tenant.

4\. Establish the final Windows endpoint.

5\. Install and validate Sysmon.

6\. Generate controlled endpoint telemetry.

7\. Configure telemetry collection into Log Analytics.

8\. Verify events in Microsoft Sentinel.

9\. Validate and modify KQL against the real schema.

10\. Execute the first controlled attack scenario.

11\. Build the first analytics/detection rule.

12\. Generate and investigate the first incident.

13\. Map activity to MITRE ATT\&CK.

14\. Document containment and remediation recommendations.



\---



\## Immediate Resume Point



If work is resumed in a new ChatGPT conversation:



1\. Read this file first.

2\. Review the latest Git history/status.

3\. Confirm whether the North Bridge Group Business Premium tenant has been

&#x20;  activated.

4\. If activated, verify tenant/domain/admin details before deploying resources.

5\. If not activated, continue only tenant-independent work.



Do not restart completed architecture or planning work unless validation shows

that it needs modification.

