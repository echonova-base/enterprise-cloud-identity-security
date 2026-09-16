# September 15 - WScript to PowerShell Final Validation

## Summary

Completed final end-to-end validation of the `PowerShell Launched by WScript` detection after telemetry ingestion was restored.

## Validation Steps

- Executed a fresh controlled VBScript test.
- Confirmed fresh Sysmon Event ID 1 telemetry reached Log Analytics.
- Verified the KQL detection matched:
  - `Image = powershell.exe`
  - `ParentImage = wscript.exe`
- Confirmed the scheduled Microsoft Sentinel analytics rule fired.
- Investigated the generated alert/incident.
- Classified the activity as expected security testing.

## Detection Pipeline

`VBScript → WScript → PowerShell → Sysmon → AMA/DCR → Log Analytics → KQL → Sentinel Rule → Alert/Incident`

## Evidence

- `WScript_PowerShell_KQL_Detection.png`
- `WScript_PowerShell_Sentinel_Alert.png`

## Key Lesson

A recovered telemetry pipeline should be validated with fresh activity to confirm both ingestion and automated detection are functioning correctly.