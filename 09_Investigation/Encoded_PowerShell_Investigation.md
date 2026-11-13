# Encoded PowerShell Investigation

## Alert

`Encoded PowerShell Execution`

Severity: Medium

## Investigation Objective

Determine whether the encoded PowerShell activity represents malicious execution, legitimate administrative activity, or expected security testing.

---

## Initial Triage

When the alert is generated, review:

- alert timestamp
- affected endpoint
- PowerShell process ID
- PowerShell command line
- parent process
- user context
- related child processes
- surrounding process activity

For this lab, the affected endpoint was:

`DESKTOP-LANP3UP`

---

## Process Review

The Sysmon Event ID 1 telemetry was reviewed to confirm:

- `powershell.exe` executed
- the command line contained `-EncodedCommand`
- ProcessId and ParentProcessId values were available
- related parent/child process activity could be correlated

The encoded command was generated intentionally during controlled lab testing.

---

## Command-Line Analysis

Encoded PowerShell should not automatically be treated as malicious.

The analyst should determine:

1. What does the encoded payload decode to?
2. Does the command perform suspicious actions?
3. Was the execution expected?
4. Which process launched PowerShell?
5. Did PowerShell create suspicious child processes?
6. Did related network, file, registry, or credential activity occur?

In this lab, the payload was benign and used only to generate detectable telemetry.

---

## Context Validation

The alert was compared with known testing activity.

The execution time matched the controlled security test performed in the lab.

No evidence of unauthorized activity was identified.

---

## Analyst Decision

Classification:

`Informational, expected activity - Security testing`

Rationale:

The encoded PowerShell command was deliberately executed as part of the North Bridge Group SOC lab to validate Sysmon telemetry, KQL detection logic, Sentinel analytics-rule behavior, and incident generation.

---

## Recommended Analyst Actions in a Real Environment

If the same activity occurred unexpectedly in production:

- decode and inspect the PowerShell payload
- identify the initiating user
- investigate the parent process
- review related child processes
- search for similar activity on other endpoints
- review related authentication activity
- check endpoint/network telemetry for follow-on behavior
- escalate if the execution cannot be explained by legitimate administrative activity

---

## Key Investigation Lesson

The presence of `-EncodedCommand` is an investigation signal, not proof of malicious activity.

The analyst decision should be based on process context, command behavior, user activity, surrounding telemetry, and whether the execution was expected.