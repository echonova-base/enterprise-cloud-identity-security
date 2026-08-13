\# North Bridge Group — Enterprise Identity Design



\## Environment



North Bridge Group is a simulated organization used to model enterprise

identity and security operations scenarios.



\## Departments



\- Executive

\- Information Technology

\- Security Operations

\- Finance

\- Human Resources

\- Sales



\## Planned Test Identities



| User | Department | Role | Privilege |

|---|---|---|---|

| Alex Morgan | Executive | CEO | Standard |

| Daniel Brooks | IT | IT Administrator | Privileged |

| Marmar | Security Operations | Security Analyst | Standard |

| Sarah Chen | Finance | Finance Manager | Standard |

| Emily Carter | Human Resources | HR Manager | Standard |

| James Wilson | Sales | Sales Representative | Standard |



\## Administrative Accounts



Administrative access will be separated from normal user activity.



\### Tenant Administrator



`admin@northbridgegrouplab.onmicrosoft.com`



Purpose:



\- Tenant administration

\- Initial security configuration

\- Emergency administrative tasks



The administrator account will not be used as the normal Security Analyst

identity.



\## Planned Security Groups



\- NBG-All-Employees

\- NBG-Security-Operations

\- NBG-IT-Administrators

\- NBG-Finance

\- NBG-Human-Resources

\- NBG-Sales



\## Identity Security Controls



The lab will evaluate and implement, where licensing permits:



\- Multi-Factor Authentication

\- Conditional Access

\- Least privilege

\- Role-based access control

\- Administrative account separation

\- Authentication monitoring

\- Identity audit monitoring



\## Security Design Principle



Normal business identities and privileged administrative identities will be

separated to reduce exposure of privileged credentials and support realistic

identity-security investigations.

