# Suspicious PowerShell Validation

## Validation Status

Validated against live Sysmon Event ID 1 telemetry from `DESKTOP-LANP3UP`.

Sysmon telemetry is ingested into the Log Analytics `Event` table through Azure Monitor Agent and `dcr-nbg-sysmon`.

## Findings

- The original draft query expected PowerShell telemetry in the `SecurityEvent` table.
- Live testing showed that Sysmon Event ID 1 telemetry is available in the `Event` table.
- The initial broad search for `-EncodedCommand` matched both the PowerShell process and child processes because `RenderedDescription` also contains `ParentCommandLine`.
- The query was refined to extract `Image`, `CommandLine`, `ProcessId`, `ParentProcessId`, and `ParentImage`.
- Filtering on the extracted PowerShell `Image` and its own `CommandLine` reduced the result to the actual encoded PowerShell execution.
- The validated KQL was used as the basis for the Microsoft Sentinel analytics rule `Encoded PowerShell Execution`.

## Validation Result

The encoded PowerShell test was successfully identified using Sysmon Event ID 1 telemetry and the refined KQL query.