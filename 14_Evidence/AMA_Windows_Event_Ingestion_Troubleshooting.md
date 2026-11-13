# AMA Windows Event Ingestion Troubleshooting

## Issue

During validation of the Registry Run-key persistence scenario, Sysmon Event ID 13 was generated successfully on endpoint `DESKTOP-LANP3UP`, but fresh Sysmon events stopped appearing in the Log Analytics `Event` table.

The issue affected both:

- Sysmon Event ID 1 — Process Creation
- Sysmon Event ID 13 — Registry Value Set

---

## Initial Validation

The following components were confirmed working:

- Registry test activity executed successfully.
- Sysmon generated Event ID 13 locally.
- Azure Arc agent reported `Connected`.
- Azure Monitor Agent heartbeat was visible in Log Analytics.
- The local AMA configuration chunk contained both Event ID 1 and Event ID 13 collection rules.
- `mcsconfig.latest.xml` contained Windows Event Log subscriptions for both Event IDs.
- AMA runtime processes were running:
  - `AMAExtHealthMonitor`
  - `MonAgentCore`
  - `MonAgentHost`
  - `MonAgentLauncher`

This narrowed the issue to the Windows Event Log collection path rather than the entire Arc or AMA connection.

---

## AMA Troubleshooter

The built-in Azure Monitor Agent troubleshooter was executed from the AMA extension directory.

The troubleshooter reported:

- several IPv6 connectivity warnings
- no overall fatal failures
- `Found 0 fails`

The extension logs showed that the AMA health monitor process was initially not running.

The extension then:

1. detected the missing health monitor process
2. restarted `AMAExtHealthMonitor.exe`
3. updated the extension state
4. completed the extension enable operation
5. resumed heartbeat reporting

---

## Recovery Validation

After the AMA extension / health monitor recovery, a new controlled Run-key test was generated:

`NBG_RunKey_Recovery_Test`

The event was:

- captured locally by Sysmon as Event ID 13
- received successfully by Log Analytics
- detected by the Sentinel analytics rule
- surfaced as the `Registry Run Key Persistence` alert

This confirmed that the Windows Event Log ingestion path had recovered.

---

## Troubleshooting Logic

The troubleshooting process followed the telemetry path step by step:

`Activity → Sysmon → Arc / AMA → DCR configuration → AMA runtime → Log Analytics → Sentinel`

Each layer was validated before moving to the next.

This avoided incorrectly modifying the Sentinel rule when the actual issue was upstream in telemetry collection.

---

## Key Lesson

A healthy AMA heartbeat does not necessarily prove that every configured data