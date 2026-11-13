# PowerShell Detection Incident Response

## Scope

This response guidance applies to the two validated lab detections:

- `Encoded PowerShell Execution`
- `PowerShell Launched by WScript`

Both detections are investigation signals. Neither one alone proves malicious activity.

---

## Response Objective

If the activity is unexpected, determine whether containment is required and prevent further execution while preserving evidence for investigation.

---

## Immediate Analyst Actions

Before containment, validate:

- affected endpoint
- initiating user
- process tree
- PowerShell command line
- parent process
- child processes
- related script or file artifacts
- related network activity
- whether the activity is approved or expected

If the activity is clearly expected administrative work or approved testing, document the reason and close the alert appropriately.

If the activity is unexplained or suspicious, continue with containment.

---

## Endpoint Containment

If malicious activity is suspected:

- isolate the affected endpoint from the network using the organization's endpoint security platform
- preserve access for security investigation where possible
- prevent further suspicious PowerShell or script execution
- identify whether additional endpoints show the same behavior

Endpoint isolation should be based on the severity and confidence of the investigation.

---

## Account Containment

If the activity may involve a compromised user account:

- identify the account that initiated the process
- review recent authentication activity
- revoke active sessions if compromise is suspected
- reset credentials where appropriate
- enforce or verify MFA
- investigate suspicious sign-ins or privilege changes

---

## Process and Artifact Review

Collect or review:

- PowerShell command line
- decoded PowerShell payload if encoded
- parent and child process information
- script files
- downloaded files
- registry changes
- scheduled tasks
- persistence mechanisms
- network destinations
- hashes of suspicious files where available

---

## Encoded PowerShell-Specific Response

For `Encoded PowerShell Execution`:

1. Decode the Base64 payload.
2. Review the decoded command.
3. Determine whether the command performs:
   - file download
   - credential access
   - persistence
   - security-tool modification
   - remote execution
   - lateral movement
4. Search the environment for the same encoded or decoded command.
5. Escalate if the execution cannot be explained by legitimate activity.

---

## WScript-to-PowerShell-Specific Response

For `PowerShell Launched by WScript`:

1. Identify the VBScript or script file executed by `wscript.exe`.
2. Review the script contents.
3. Determine how the script reached the endpoint.
4. Inspect the PowerShell command launched by the script.
5. Search for the same script or process chain on other systems.
6. Investigate related file, network, and persistence activity.

---

## Eradication

If malicious activity is confirmed:

- remove malicious scripts or files
- remove persistence mechanisms
- terminate malicious processes
- block known malicious indicators
- remediate compromised accounts
- patch or harden the affected system where relevant

---

## Recovery

After containment and remediation:

- reconnect the endpoint only after validation
- monitor for recurrence
- confirm required business applications continue to function
- verify no related alerts appear on other systems
- review whether additional detection logic should be created

---

## Detection Improvement

After the incident, review whether the existing rules require tuning.

Possible improvements include:

- excluding known administrative scripts
- adding trusted-user or trusted-host context
- correlating process behavior with network activity
- increasing severity when additional suspicious behavior is observed
- creating related detections for child processes or persistence activity

---

## Lab Disposition

For the North Bridge Group lab, both detections were generated intentionally.

Final classification:

`Informational, expected activity - Security testing`

No containment or remediation was required.

---

## Key Response Lesson

A SOC analyst should not immediately isolate a machine simply because PowerShell or WScript appears in an alert.

Containment decisions should be based on investigation results, business context, confidence, and evidence of malicious behavior.