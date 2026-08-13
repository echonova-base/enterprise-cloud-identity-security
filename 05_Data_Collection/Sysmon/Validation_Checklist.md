\# Sysmon Validation Checklist



\## Objective



Validate that Sysmon is enabled, using the intended configuration, and

generating the telemetry required for North Bridge Group investigations.



\## Validation Steps



\### 1. Confirm Sysmon is running

Verify that Sysmon is installed/enabled on the Windows endpoint.



\### 2. Open the Sysmon Operational Log

Open Event Viewer and navigate to:



Applications and Services Logs

→ Microsoft

→ Windows

→ Sysmon

→ Operational



\### 3. Validate Process Creation

Launch PowerShell normally.



Expected result:

\- Sysmon Event ID 1 is generated

\- Process image identifies PowerShell

\- Parent process is visible

\- User and timestamp are recorded



\### 4. Validate Network Connection Logging

Generate a normal outbound network connection from the endpoint.



Expected result:

\- Sysmon Event ID 3 is generated

\- Source process is visible

\- Destination IP/port are recorded where available



\### 5. Validate File Creation

Create a harmless test file.



Expected result:

\- Sysmon Event ID 11 is generated

\- File path and responsible process are recorded



\### 6. Validate Registry Telemetry

Perform a safe, reversible registry-value change in the lab.



Expected result:

\- Relevant Sysmon RegistryEvent telemetry is generated

\- Event ID 13 is reviewed where applicable



\### 7. Validate Investigation Fields

Confirm telemetry provides enough context to answer:



\- Who performed the action?

\- What process or command was involved?

\- What parent process launched it?

\- Which endpoint generated the event?

\- When did it occur?

\- What related activity happened before and after?



\## Success Criteria



Sysmon is considered ready for Sentinel integration when the required

telemetry is generated consistently and the fields needed for investigation

are present.

