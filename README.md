# Enterprise Cloud Identity Security

A hands-on Microsoft security lab focused on endpoint telemetry, detection engineering, investigation, and incident response using Microsoft Sentinel, Log Analytics, Sysmon, Azure Monitor Agent, and KQL.

## Project Overview

This project simulates suspicious Windows activity in a controlled lab environment and follows the full SOC workflow:

`Endpoint activity → Sysmon → Azure Monitor Agent → Data Collection Rule → Log Analytics → Microsoft Sentinel → Alert → Investigation → Response`

The goal is to practice how security analysts collect telemetry, build detections, investigate alerts, map activity to MITRE ATT&CK, and document incident-response decisions.

## Lab Environment

- Windows 11 virtual machine hosted in VMware
- Microsoft Sentinel
- Azure Log Analytics
- Azure Monitor Agent
- Azure Arc
- Sysmon
- KQL
- Microsoft Defender portal

## Detection Scenarios

### 1. Encoded PowerShell Execution

Simulated suspicious PowerShell execution using an encoded command.

The detection identifies PowerShell processes launched with parameters such as:

- `-EncodedCommand`
- `-enc`

The scenario validates:

- Sysmon process creation telemetry
- PowerShell command-line analysis
- KQL parsing
- Sentinel analytics-rule creation
- alert investigation

MITRE ATT&CK:

**T1059.001 - PowerShell**

---

### 2. PowerShell Launched by WScript

Simulated a suspicious process chain:

`explorer.exe → wscript.exe → powershell.exe → whoami.exe`

The detection focuses on PowerShell being launched by Windows Script Host and demonstrates how parent-child process relationships can provide behavioral context.

MITRE ATT&CK:

- **T1059.001 - PowerShell**
- **T1059.005 - Visual Basic**

---

### 3. Registry Run-Key Persistence

Simulated persistence by creating a benign Windows Registry Run-key value pointing to `notepad.exe`.

The activity generated Sysmon Event ID 13 and was detected using KQL and a scheduled Sentinel analytics rule.

MITRE ATT&CK:

**T1547.001 - Registry Run Keys / Startup Folder**

The scenario also included troubleshooting a Windows Event Log ingestion issue involving Azure Arc, Azure Monitor Agent, and Data Collection Rules.

## Detection Engineering

The project uses KQL to extract and analyze information from Sysmon events stored in the Log Analytics `Event` table.

Examples of parsed fields include:

- process image
- command line
- parent process
- process ID
- Registry target
- Registry value data

Detections were converted into scheduled Microsoft Sentinel analytics rules and validated using controlled security tests.

## Investigation and Incident Response

Each validated detection includes an analyst investigation workflow.

Alerts were reviewed for:

- affected endpoint
- initiating process
- parent-child process relationships
- command-line activity
- Registry modifications
- user context
- expected versus unexpected behavior

Controlled lab alerts were classified as expected security testing after validation.

## Key Learning Outcomes

This project provided practical experience with:

- endpoint telemetry collection
- Sysmon event analysis
- KQL detection development
- Microsoft Sentinel analytics rules
- MITRE ATT&CK mapping
- alert investigation
- false-positive analysis
- incident classification
- telemetry troubleshooting
- Azure Arc and Azure Monitor Agent
- Data Collection Rules
- security documentation

## Repository Structure

- `01_Project_Definition` - project scope and objectives
- `02_Architecture` - lab architecture and data flow
- `03_Threat_Model` - threat-model documentation
- `04_Attack_Scenarios` - controlled attack simulations
- `05_Data_Collection` - telemetry and collection configuration
- `06_KQL_Hunting` - hunting and detection queries
- `07_Detection_Engineering` - detection-rule documentation
- `08_Threat_Hunting` - threat-hunting work
- `09_Investigation` - analyst investigation workflows
- `10_Incident_Response` - response guidance
- `11_MITRE_ATT&CK` - ATT&CK mappings
- `12_Security_Recommendations` - security improvement recommendations
- `13_Executive_Report` - executive-level findings
- `14_Evidence` - screenshots and technical evidence

## Project Status

Three end-to-end detection scenarios have been validated:

1. Encoded PowerShell Execution
2. PowerShell Launched by WScript
3. Registry Run-Key Persistence

The project is currently in final documentation and portfolio-refinement phase.
