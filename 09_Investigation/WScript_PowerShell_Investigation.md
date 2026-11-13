# WScript to PowerShell Investigation

## Alert

`PowerShell Launched by WScript`

Severity: Medium

## Investigation Objective

Determine whether PowerShell launched by `wscript.exe` represents malicious script execution, legitimate automation, or expected security testing.

---

## Initial Triage

Review:

- alert timestamp
- affected endpoint
- PowerShell process ID
- parent process
- PowerShell command line
- initiating user
- child processes
- nearby process activity
- related file or network activity

For this lab, the affected endpoint was:

`DESKTOP-LANP3UP`

---

## Process Relationship Review

The detection was based on the parent-child relationship:

`wscript.exe → powershell.exe`

Sysmon Event ID 1 telemetry confirmed that PowerShell was launched by Windows Script Host.

The controlled lab process chain was:

`explorer.exe → wscript.exe → powershell.exe → whoami.exe`

---

## Why the Parent Process Matters

PowerShell is commonly used for legitimate administration.

The presence of `powershell.exe` alone is therefore not enough to determine whether activity is malicious.

The parent process provides additional execution context.

In this case, `wscript.exe` launching PowerShell may indicate script-driven execution and should be investigated further when unexpected.

---

## Command-Line Review

The analyst should inspect the PowerShell command line and determine:

1. What command was executed?
2. Was the PowerShell execution expected?
3. What script caused `wscript.exe` to launch PowerShell?
4. Did PowerShell launch additional child processes?
5. Did the process create files, modify the registry, or make network connections?
6. Was the same behavior observed on other endpoints?

In this lab, the PowerShell command was benign and intentionally generated for detection testing.

---

## Context Validation

The event timestamp matched the controlled WScript test.

The process chain and command line were consistent with the expected lab activity.

No evidence of unauthorized activity was identified.

---

## Analyst Decision

Classification:

`Informational, expected activity - Security testing`

Rationale:

The WScript-to-PowerShell process relationship was deliberately generated to validate Sysmon process telemetry, KQL parent-child detection logic, Sentinel analytics-rule behavior, and alert generation.

---

## Recommended Analyst Actions in a Real Environment

If the same activity occurred unexpectedly:

- identify the script executed by `wscript.exe`
- inspect the PowerShell command line
- review parent and child processes
- identify the initiating user
- check for related files or script artifacts
- review network activity from the process
- search for the same behavior across other endpoints
- determine whether the activity matches approved administrative automation
- escalate if the execution is unexplained or suspicious

---

## Key Investigation Lesson

A suspicious parent-child process relationship is an investigation signal, not proof of malicious activity.

The analyst should combine process ancestry, command-line behavior, user context, and surrounding telemetry before making a final decision.