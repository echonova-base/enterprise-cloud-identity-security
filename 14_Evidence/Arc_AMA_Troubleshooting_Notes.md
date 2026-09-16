# September 14 - Azure Arc and AMA Telemetry Troubleshooting

## Summary

Investigated a telemetry ingestion issue where fresh Sysmon Event ID 1 data stopped appearing in Log Analytics even though the test activity and local Sysmon logging continued to work.

## Troubleshooting Process

- Confirmed the WScript → PowerShell test executed successfully.
- Confirmed Sysmon Event ID 1 continued to be generated locally.
- Identified the Azure Arc-connected endpoint as offline.
- Verified the Connected Machine Agent reported a disconnected state.
- Restarted the Arc agent service and restored connectivity.
- Verified network connectivity to Microsoft services.
- Confirmed the Azure Monitor Agent extension remained installed and reported `Succeeded`.
- Ran the Microsoft Azure Monitor Agent troubleshooter.
- Troubleshooter reported zero failures and several non-blocking IPv6 warnings.
- Identified the correct AMA datastore path:

  `C:\Resources\Directory\AMADataStore.DESKTOP-LANP3UP`

- Confirmed the downloaded DCR configuration existed locally.
- Verified `dcr-nbg-sysmon` remained associated with `DESKTOP-LANP3UP`.
- Confirmed fresh Sysmon Event ID 1 telemetry resumed in Log Analytics.

## Key Lesson

The problem was isolated by validating each stage of the telemetry pipeline separately:

`Test Activity → Sysmon → Arc Connectivity → AMA → DCR → Log Analytics`

The troubleshooting process demonstrated that local logging can remain healthy while cloud telemetry delivery is interrupted.