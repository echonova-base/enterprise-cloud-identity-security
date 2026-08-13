\# North Bridge Group — Attack Scenario Plan



\## Purpose



This lab will simulate authorized security incidents against test identities

and endpoints belonging exclusively to the North Bridge Group lab environment.



The objective is to generate realistic telemetry, develop detections,

investigate resulting alerts, and practice incident response.



\---



\# Scenario 1 — Repeated Authentication Failures Followed by Success



\## Scenario



A North Bridge Group employee account experiences a high number of failed

authentication attempts followed by a successful authentication.



Target test identity:



Sarah Chen — Finance Manager



\## Security Question



Does the authentication pattern represent legitimate user behavior,

credential guessing, or potential account compromise?



\## Investigation Pivots



The SOC analyst will investigate:



\- Number and frequency of failed authentication attempts

\- Source IP address

\- Geographic location

\- Time of authentication

\- Historical authentication behavior

\- Device information

\- Successful authentication source

\- User roles and privileges

\- Activity occurring after successful authentication

\- User validation where appropriate



\## Detection Objective



Identify accounts experiencing an abnormal number of authentication failures

within a defined time window and determine whether a successful authentication

subsequently occurs.



\## SOC Outcome



Build an authentication timeline and determine whether the activity is:



\- Benign

\- Suspicious

\- Confirmed compromise



\---



\# Scenario 2 — Suspicious PowerShell Execution



\## Scenario



A Windows endpoint executes PowerShell commands that resemble attacker

reconnaissance or post-compromise activity.



\## Security Question



Is PowerShell being used for legitimate administration or suspicious activity?



\## Telemetry



Planned telemetry includes:



\- Windows process creation events

\- PowerShell activity

\- Sysmon process creation

\- Parent/child process relationships

\- Command-line information



\## Detection Objective



Develop KQL queries and Sentinel analytics capable of identifying suspicious

PowerShell behavior while distinguishing it from expected administrative use.



\## Investigation



The analyst will examine:



\- Executing user

\- Parent process

\- Command line

\- Execution time

\- Related processes

\- Network activity

\- Subsequent endpoint behavior



\---



\# Scenario 3 — Privileged Group or Role Change



\## Scenario



A test identity is unexpectedly granted elevated privileges within the

North Bridge Group environment.



\## Security Question



Was the privilege change authorized, accidental, or potentially malicious?



\## Detection Objective



Identify security-relevant changes to privileged identities, groups, or roles.



\## Investigation



The analyst will determine:



\- Who initiated the change

\- Which identity received privileges

\- Previous privilege level

\- New privilege level

\- Time of change

\- Source/context of the administrative action

\- Activity performed after elevation



\---



\# Scenario 4 — Endpoint Persistence



\## Scenario



A persistence mechanism is created on the controlled Windows endpoint.



The simulation will use a safe lab technique selected during implementation.



\## Security Question



Can endpoint telemetry identify the persistence mechanism and reconstruct

the activity that created it?



\## Detection Objective



Develop a detection for the selected persistence behavior using Windows

and/or Sysmon telemetry.



\## Investigation



The analyst will examine:



\- Process responsible for persistence

\- User context

\- Creation timestamp

\- Parent/child process relationships

\- Associated commands

\- Subsequent execution

\- Related network activity



\---



\# Investigation Methodology



For each scenario, the SOC workflow will follow:



Attack Simulation

&#x20;       ↓

Telemetry Generation

&#x20;       ↓

Log Collection

&#x20;       ↓

KQL Analysis

&#x20;       ↓

Detection Rule

&#x20;       ↓

Alert / Incident

&#x20;       ↓

Investigation

&#x20;       ↓

Timeline Reconstruction

&#x20;       ↓

MITRE ATT\&CK Mapping

&#x20;       ↓

Containment / Remediation Recommendation

&#x20;       ↓

Lessons Learned



\---



\# Safety Boundary



All attack simulations will occur only against identities, endpoints, and

resources explicitly created for the North Bridge Group lab.



No attacks will be performed against McGill University systems, identities,

networks, or other third-party infrastructure.

