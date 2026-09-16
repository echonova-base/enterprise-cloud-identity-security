# September 9 - Encoded PowerShell Detection Validation

## Summary

Validated the first complete Microsoft Sentinel detection pipeline using Sysmon Event ID 1 telemetry from the Windows lab endpoint.

## Completed

- Confirmed Azure Monitor Agent and DCR delivery of Sysmon Event ID 1 to Log Analytics.
- Validated that telemetry was stored in the `Event` table.
- Parsed `RenderedDescription` to extract:
  - Image
  - CommandLine
  - ProcessId
  - ParentProcessId
  - ParentImage
- Generated a controlled encoded PowerShell execution.
- Developed and validated KQL detection logic.
- Created scheduled analytics rule `Encoded PowerShell Execution`.
- Generated and investigated a Medium-severity alert/incident.
- Classified the activity as expected security testing.
- Investigated duplicate incidents and identified overlapping analytics-rule windows.
- Tuned the rule from a 10-minute lookback to a 5-minute lookback while retaining a 5-minute execution frequency.

## Key Lesson

The first end-to-end detection pipeline was successfully validated:

`Sysmon → AMA/DCR → Log Analytics → KQL → Sentinel Analytics Rule → Alert → Incident`

The duplicate incident behavior demonstrated the importance of tuning analytics-rule scheduling and lookback periods.