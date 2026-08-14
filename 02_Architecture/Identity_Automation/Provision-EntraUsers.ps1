$csvPath = Join-Path $PSScriptRoot "users.csv"
$users = Import-Csv $csvPath

foreach ($user in $users) {

    $upn = "$($user.Username)@northbridgegrouplab.onmicrosoft.com"

    Write-Host "Checking $upn ..."

    $existingUser = Get-MgUser -Filter "userPrincipalName eq '$upn'" -ErrorAction SilentlyContinue

    if ($existingUser) {
        Write-Host "SKIPPED - User already exists: $upn"
        continue
    }

$securePassword = Read-Host "Enter temporary password for new users" -AsSecureString

$tempPassword = [System.Net.NetworkCredential]::new(
    "",
    $securePassword
).Password

$passwordProfile = @{
    Password = $tempPassword
    ForceChangePasswordNextSignIn = $true
}

    try {
        New-MgUser `
            -AccountEnabled:$true `
            -DisplayName $user.DisplayName `
            -MailNickname $user.Username `
            -UserPrincipalName $upn `
            -Department $user.Department `
            -JobTitle $user.JobTitle `
            -PasswordProfile $passwordProfile `
            -ErrorAction Stop

        Write-Host "CREATED - $upn"
    }
    catch {
        Write-Host "FAILED - $upn"
        Write-Host "Reason: $($_.Exception.Message)"
    }
}