\# Day 1 - Environment Deployment



\*\*Date:\*\* August 12, 2026



\## Objective



Establish the foundational Azure and Microsoft Sentinel environment for an

enterprise security monitoring and incident response lab.



\## Activities Completed



\- Activated Azure for Students subscription.

\- Created the project resource group.

\- Created a Log Analytics workspace in Canada Central.

\- Enabled Microsoft Sentinel.

\- Activated the 31-day Microsoft Sentinel free trial.

\- Verified access to Sentinel Content Hub and SOC capabilities.

\- Installed and configured Git.

\- Connected the local project repository to GitHub.

\- Documented the initial security architecture.



\## Issues Encountered



\### Azure Regional Deployment Policy



The initial Log Analytics deployment to Canada East was blocked by an Azure

subscription policy.



Allowed deployment regions were identified as:



\- Canada Central

\- West US

\- Norway East

\- Mexico Central

\- Central US



The Log Analytics workspace was subsequently deployed successfully in

Canada Central.



\### Microsoft Entra Authorization Boundary



The Azure for Students subscription is associated with the McGill University

Microsoft Entra tenant.



The student account can manage permitted Azure subscription resources but

does not have administrative access to the university Entra tenant.



Entra administrative access returned HTTP 401 Unauthorized.



\## Security Response



No attempt was made to bypass the university tenant's access controls.



Identity telemetry and identity attack simulations will only be performed

within an authorized lab environment under administrative control of the

project owner.



\## Key Learning



Azure subscription permissions and Microsoft Entra tenant permissions are

separate authorization boundaries.



Access to Azure resources within a subscription does not imply administrative

control of the associated Entra tenant.



\## Next Steps



\- Establish the first controlled security telemetry source.

\- Begin collecting security events in Microsoft Sentinel.

\- Deploy endpoint telemetry for detection engineering and threat hunting.

\- Evaluate an independent Microsoft Entra lab tenant for identity-security

&#x20; scenarios.

