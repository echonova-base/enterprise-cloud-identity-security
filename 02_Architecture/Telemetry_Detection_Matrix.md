\# North Bridge Group — Telemetry \& Detection Matrix



| Scenario | Evidence Needed | Primary Telemetry | Analysis |

|---|---|---|---|

| Authentication failures → success | User, IP, location, time, authentication result | Entra sign-in logs | KQL / Sentinel |

| Suspicious PowerShell | User, command line, process, parent process, endpoint, time | PowerShell logs + Sysmon | KQL / Sentinel |

| Privilege change | Actor, target user, role/group, timestamp | Entra audit logs | KQL / Sentinel |

| Endpoint persistence | Process, command, user, registry/task/service activity | Windows logs + Sysmon | KQL / Sentinel |

