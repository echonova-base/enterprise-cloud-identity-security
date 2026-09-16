# PowerShell Launched by WScript Detection

## Objective

Detect PowerShell execution when the parent process is `wscript.exe`.

This parent-child relationship can be suspicious because Windows Script Host may be used to launch PowerShell as part of script-based execution.

---

## Test Scenario

A controlled VBScript was used to generate the following process chain:

`explorer.exe → wscript.exe → powershell.exe → whoami.exe`

The test script launched PowerShell with a benign command for lab validation.

---

## Data Source

- Endpoint: `DESKTOP-LANP3UP`
- Log source: Sysmon
- Event ID: `1` - Process Creation
- Log Analytics table: `Event`

Sysmon process-creation data was stored inside the `RenderedDescription` field, so KQL parsing was required to extract process details.

---

## Detection Logic

```kusto
Event
| where EventLog == "Microsoft-Windows-Sysmon/Operational"
| where EventID == 1
| extend Image = extract(@"Image:\s*([^\r\n]+?)\s+FileVersion:", 1, RenderedDescription)
| extend CommandLine = extract(@"CommandLine:\s*([^\r\n]+?)\s+CurrentDirectory:", 1, RenderedDescription)
| extend ProcessId = extract(@"ProcessId:\s*(\d+)", 1, RenderedDescription)
| extend ParentProcessId = extract(@"ParentProcessId:\s*(\d+)", 1, RenderedDescription)
| extend ParentImage = extract(@"ParentImage:\s*([^\r\n]+?)\s+ParentCommandLine:", 1, RenderedDescription)
| where Image endswith @"\powershell.exe"
| where ParentImage endswith @"\wscript.exe"
| project TimeGenerated, Computer, ProcessId, Image, CommandLine, ParentProcessId, ParentImage
| order by TimeGenerated desc