# Registry Run Key Persistence Detection

## Objective

Detect modifications to common Windows Registry Run and RunOnce locations that may be used to establish persistence.

This detection focuses on Sysmon Event ID 13 (`Registry value set`) activity involving:

- `Software\Microsoft\Windows\CurrentVersion\Run`
- `Software\Microsoft\Windows\CurrentVersion\RunOnce`

Registry Run keys are commonly used by legitimate software but may also be abused by attackers to automatically execute a program when a user signs in.

---

## MITRE ATT&CK Mapping

- **Tactic:** Persistence
- **Technique:** T1547.001 — Registry Run Keys / Startup Folder

---

## Data Source

- Endpoint: `DESKTOP-LANP3UP`
- Telemetry source: Sysmon
- Event ID: `13` — Registry value set
- Azure collection: Azure Monitor Agent and `dcr-nbg-sysmon`
- Log Analytics workspace: `law-nbg-soc-lab`
- Log Analytics table: `Event`

The Data Collection Rule collects Sysmon Event IDs 1 and 13 from:

`Microsoft-Windows-Sysmon/Operational`

---

## Controlled Test Scenario

A benign Registry Run-key value was created using `reg.exe`.

The final validation test used:

`NBG_RunKey_Recovery_Test`

The value pointed to:

`C:\Windows\System32\notepad.exe`

This allowed the persistence behavior to be simulated without executing malicious code.

The expected activity was:

`reg.exe → HKCU\Software\Microsoft\Windows\CurrentVersion\Run → notepad.exe`

---

## Detection Logic

```kusto
Event
| where EventLog == "Microsoft-Windows-Sysmon/Operational"
| where EventID == 13
| extend Image = extract(@"Image:\s*(.+?)\s+TargetObject:", 1, RenderedDescription)
| extend TargetObject = extract(@"TargetObject:\s*(.+?)\s+Details:", 1, RenderedDescription)
| extend Details = extract(@"Details:\s*(.+?)\s+User:", 1, RenderedDescription)
| where TargetObject contains @"\Software\Microsoft\Windows\CurrentVersion\Run\"
   or TargetObject contains @"\Software\Microsoft\Windows\CurrentVersion\RunOnce\"
| project TimeGenerated, Computer, Image, TargetObject, Details
| order by TimeGenerated desc
```

---

## Validation

The controlled Registry Run-key modification was successfully observed locally as Sysmon Event ID 13.

After telemetry ingestion was restored, the event was also successfully received by Log Analytics.

The query extracted:

- the process responsible for the modification
- the Registry target path
- the value data associated with the persistence entry

The validated test showed:

- `Image`: `C:\WINDOWS\system32\reg.exe`
- `TargetObject`: Registry Run key containing the NBG lab test value
- `Details`: `C:\Windows\System32\notepad.exe`

---

## Sentinel Analytics Rule

A scheduled Microsoft Sentinel analytics rule was created with the following configuration:

- **Name:** `Registry Run Key Persistence`
- **Severity:** Medium
- **MITRE ATT&CK:** T1547.001 — Registry Run Keys / Startup Folder
- **Query frequency:** 5 minutes
- **Lookup period:** 5 minutes
- **Alert threshold:** Greater than 0
- **Incident creation:** Enabled
- **Alert grouping:** Disabled

The rule successfully generated a Microsoft Defender / Sentinel alert after the controlled Run-key persistence activity was detected.

---

## Analyst Validation

The generated alert contained the expected event details:

- Endpoint: `DESKTOP-LANP3UP`
- Process: `reg.exe`
- Registry Run-key target
- Value data pointing to `notepad.exe`

The alert was reviewed and classified as:

`Informational, expected activity - Security testing`

The alert was then marked as resolved.

---

## Detection Considerations

Registry Event ID 13 can generate significant benign activity.

During testing, legitimate applications such as OneDrive also modified Registry Run locations.

Therefore, a production detection should consider additional context such as:

- initiating process
- known or trusted applications
- signer or reputation information
- unusual executable paths
- suspicious command-line behavior
- user context
- related process or network activity

A Registry Run-key modification is an investigation signal and should not automatically be treated as malicious.

---

## Result

The complete detection path was validated:

`Registry modification → Sysmon Event ID 13 → AMA/DCR → Log Analytics → Sentinel analytics rule → Alert → Analyst disposition`