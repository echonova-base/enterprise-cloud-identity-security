# Registry Run Key Persistence Investigation

## Alert

**Alert name:** `Registry Run Key Persistence`

**Severity:** Medium

**MITRE ATT&CK:** T1547.001 — Registry Run Keys / Startup Folder

---

## Investigation Summary

A Microsoft Sentinel scheduled analytics rule detected a modification to a Windows Registry Run key on endpoint `DESKTOP-LANP3UP`.

The alert was generated from Sysmon Event ID 13 telemetry collected through Azure Monitor Agent and the configured Data Collection Rule.

The activity was part of a controlled lab simulation designed to validate detection of Registry-based persistence.

---

## Observed Activity

The alert contained the following relevant details:

- **Computer:** `DESKTOP-LANP3UP`
- **Process:** `C:\WINDOWS\system32\reg.exe`
- **Registry location:** Windows `CurrentVersion\Run`
- **Value data:** `C:\Windows\System32\notepad.exe`

The Registry value was intentionally created as part of the lab.

No malicious executable or payload was used.

---

## Analyst Assessment

The use of a Registry Run key can represent persistence because programs configured in this location may execute automatically when a user signs in.

However, this activity was expected in the lab environment.

The observed process, Registry target, and value data matched the controlled security test.

The alert was therefore classified as:

`Informational, expected activity - Security testing`

The alert was marked as resolved.

---

## Investigation Outcome

No containment or remediation action was required beyond removing the test Registry values after validation.

The controlled test confirmed that the detection logic successfully identified the persistence technique and generated an analyst-visible alert.

---

## Evidence

Relevant evidence includes:

- Sysmon Event ID 13 showing the Registry value modification
- Log Analytics KQL detection results
- Microsoft Defender / Sentinel alert details
- Alert classification and resolution

Primary alert evidence:

`14_Evidence\RunKey_Persistence_Sentinel_Alert.png`

---

## Result

The investigation workflow successfully validated:

`Detection → Alert review → Context validation → Classification → Resolution`