\# Sysmon Telemetry Requirements



For suspicious process execution investigations, the endpoint telemetry should allow the analyst to determine:



\- Who executed the process

\- What process and command were executed

\- What parent process launched it

\- Which endpoint generated the activity

\- When the activity occurred

\- What related activity occurred before and after the event





\## Required Sysmon Events



\### Event ID 1 — Process Creation

Used to investigate process execution, including process image, command line,

parent process, user context, and execution time.



Primary use:

\- Suspicious PowerShell investigation

\- Parent-child process analysis

\- Command-line analysis



\### Event ID 3 — Network Connection

Used to correlate processes with outbound and inbound network connections.



Primary use:

\- Identify network activity associated with suspicious processes

\- Correlate endpoint execution with remote destinations



\### Event ID 11 — File Create

Used to identify files created by processes on the endpoint.



Primary use:

\- Identify files created or downloaded during suspicious activity

\- Correlate file creation with process execution



\### Event ID 13 — Registry Value Set

Used to identify registry value modifications.



Primary use:

\- Investigate registry-based persistence

\- Correlate registry modifications with responsible processes

