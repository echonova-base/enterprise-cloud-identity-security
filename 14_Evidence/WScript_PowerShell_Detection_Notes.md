# September 10 - WScript to PowerShell Detection

## Summary

Developed a second behavioral detection scenario based on a suspicious parent-child process relationship.

## Test Scenario

A controlled VBScript generated the following process chain:

`explorer.exe → wscript.exe → powershell.exe → whoami.exe`

Local Sysmon Event ID 1 telemetry confirmed the expected parent-child relationships.

## Detection Logic

KQL was created to detect `powershell.exe` when its parent process was `wscript.exe`.

Key detection condition:

`wscript.exe → powershell.exe`

## MITRE ATT&CK Mapping

- `T1059.001` - PowerShell
- `T1059.005` - Visual Basic

## Microsoft Sentinel Rule

Created scheduled analytics rule:

`PowerShell Launched by WScript`

Configuration:

- Severity: Medium
- Frequency: 5 minutes
- Lookback: 5 minutes
- Threshold: Greater than 0
- Incident creation enabled

## Status

The scenario and detection logic were validated locally and against earlier cloud telemetry.

Fresh telemetry later stopped reaching Log Analytics, leading to Azure Arc / Azure Monitor Agent troubleshooting before final alert validation.

## Key Lesson

The scenario demonstrated behavioral detection using parent-child process relationships rather than relying only on process names.