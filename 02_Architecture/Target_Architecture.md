\# North Bridge Group — Target Security Architecture



\## Project Objective



Design and implement a simulated enterprise security operations environment for North Bridge Group using Microsoft cloud security technologies.



The lab will support identity monitoring, endpoint telemetry, detection engineering, threat hunting, incident investigation, and incident response.



\## Core Components



\### Identity

\- Microsoft Entra ID

\- Simulated enterprise users

\- Security groups

\- Privileged administrator account

\- MFA

\- Conditional Access



\### Endpoint

\- Windows endpoint

\- Windows Security Event Logs

\- Sysmon

\- Microsoft Defender



\### Security Monitoring

\- Azure Log Analytics

\- Microsoft Sentinel

\- Azure Monitor Agent

\- Data Collection Rules



\### Security Operations

\- KQL threat hunting

\- Sentinel analytics rules

\- Incident generation

\- Incident investigation

\- MITRE ATT\&CK mapping

\- Incident response documentation



\## Telemetry Flow



Windows Endpoint

→ Windows Security Events / Sysmon

→ Azure Monitor Agent

→ Log Analytics

→ Microsoft Sentinel

→ KQL / Analytics Rules

→ Incident

→ Investigation

→ Response



\## Identity Flow



Microsoft Entra ID

→ Users / Groups / Privileged Accounts

→ Authentication and Identity Events

→ Security Monitoring

→ Microsoft Sentinel

→ Detection and Investigation



\## Current Architecture Constraint



The initial Azure for Students subscription and Microsoft Sentinel workspace were provisioned under the McGill University directory.



The project requires a separately controlled Microsoft Entra tenant in which the project owner has administrative privileges.



A Microsoft 365 Business Premium trial is being evaluated to provide this controlled tenant.



No additional tenant-dependent infrastructure will be deployed until the relationship between the controlled tenant and the existing Azure subscription has been validated.



\## Design Principle



Infrastructure decisions will prioritize portability, reproducibility, evidence preservation, and least privilege.



All reusable project artifacts—including architecture documentation, KQL queries, detection rules, investigation reports, and configuration evidence—will be maintained in GitHub.

