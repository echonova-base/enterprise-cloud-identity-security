# Department-specific group assignments
$assignments = @(
    @{ User="sarah.chen";     Group="NBG-Finance" }
    @{ User="alex.morgan";    Group="NBG-Security-Operations" }
    @{ User="daniel.brooks";  Group="NBG-IT-Administrators" }
    @{ User="emily.carter";   Group="NBG-Human-Resources" }
    @{ User="james.wilson";   Group="NBG-Sales" }
    @{ User="maya.patel";     Group="NBG-Finance" }
)

$domain = "northbridgegrouplab.onmicrosoft.com"

# Standard employee identities.
# The privileged administrator account is intentionally excluded.
$employeeUsernames = @(
    "sarah.chen",
    "alex.morgan",
    "daniel.brooks",
    "emily.carter",
    "james.wilson",
    "maya.patel",
    "olivia.bennett"
)

function Add-UserToGroupIfNeeded {
    param (
        [string]$UserPrincipalName,
        [string]$GroupName
    )

    try {
        $user = Get-MgUser `
            -UserId $UserPrincipalName `
            -ErrorAction Stop
    }
    catch {
        Write-Host "FAILED - User not found: $UserPrincipalName"
        return
    }

    $group = Get-MgGroup -Filter "displayName eq '$GroupName'"

    if (-not $group) {
        Write-Host "FAILED - Group not found: $GroupName"
        return
    }

    $isMember = Get-MgGroupMember `
        -GroupId $group.Id `
        -All |
        Where-Object { $_.Id -eq $user.Id }

    if ($isMember) {
        Write-Host "SKIPPED - $UserPrincipalName already in $GroupName"
        return
    }

    try {
        New-MgGroupMemberByRef `
            -GroupId $group.Id `
            -BodyParameter @{
                "@odata.id" = "https://graph.microsoft.com/v1.0/directoryObjects/$($user.Id)"
            } `
            -ErrorAction Stop

        Write-Host "ADDED - $UserPrincipalName -> $GroupName"
    }
    catch {
        Write-Host "FAILED - $UserPrincipalName -> $GroupName"
        Write-Host "Reason: $($_.Exception.Message)"
    }
}

# Add all standard employees to the general employee group.
foreach ($username in $employeeUsernames) {
    $upn = "$username@$domain"

    Add-UserToGroupIfNeeded `
        -UserPrincipalName $upn `
        -GroupName "NBG-All-Employees"
}

# Add users to their department/security-specific groups.
foreach ($assignment in $assignments) {
    $upn = "$($assignment.User)@$domain"

    Add-UserToGroupIfNeeded `
        -UserPrincipalName $upn `
        -GroupName $assignment.Group
}