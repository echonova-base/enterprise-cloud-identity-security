\# Microsoft Entra ID Identity Automation



This folder contains PowerShell automation used to provision and organize identities in the fictional North Bridge Group Microsoft Entra ID environment.



\## Objectives



The automation was developed to:



\- Provision fictional employee identities from structured CSV data.

\- Populate identity attributes such as department and job title.

\- Assign standard employees to the NBG-All-Employees security group.

\- Assign employees to department or security-specific groups.

\- Keep the privileged administrator identity separate from standard employee groups.

\- Prevent duplicate user creation and duplicate group membership.

\- Provide basic error handling for failed Graph operations.



\## Files



\### Provision-EntraUsers.ps1



Reads employee information from `users.csv` and provisions Microsoft Entra ID users through Microsoft Graph PowerShell.



The script:



\- Builds each user's User Principal Name (UPN).

\- Checks whether the account already exists.

\- Prompts securely for a temporary password rather than storing credentials in the script.

\- Creates new users with department and job-title attributes.

\- Requires users to change the temporary password at first sign-in.

\- Reports successful, skipped, and failed operations.



\### Assign-EntraGroups.ps1



Automates security-group membership.



The script:



\- Adds standard employee identities to `NBG-All-Employees`.

\- Assigns users to department/security groups.

\- Resolves users and groups through Microsoft Graph.

\- Checks existing membership before making changes.

\- Skips duplicate memberships.

\- Handles missing users, missing groups, and failed membership operations.



\### users.csv



Contains fictional employee data used by the provisioning script.



\## Microsoft Graph



The implementation uses Microsoft Graph PowerShell to interact with Microsoft Entra ID.



Example permissions used during the lab:



\- `User.ReadWrite.All`

\- `Group.ReadWrite.All`

\- `Directory.ReadWrite.All`



The lab administrator authenticated using delegated permissions.



\## Security Considerations



No passwords, authentication tokens, or payment information are stored in this repository.



The privileged administrator account is intentionally excluded from the standard employee group.



The published provisioning script prompts for a temporary password at runtime rather than embedding credentials in source code.



This environment is a fictional cybersecurity lab and does not represent a production organization.

