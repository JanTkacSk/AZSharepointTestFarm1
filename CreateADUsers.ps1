
Start-Transcript  C:\CreateADUsers.txt
do {
    Start-Sleep -Seconds 2
}
until (
    (Get-Service NTDS -EA SilentlyContinue).status -eq "running" -and (Get-Service ADWS -EA SilentlyContinue).status -eq "running"
)
$PwdPlain = "PublicPassword123@!"
$PwdSecString = ConvertTo-SecureString -String $PwdPlain -AsPlainText -Force
New-ADuser -Name SPAdminAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SPServiceAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SQLServiceAcc -AccountPassword $PwdSecString -Enabled $true
Stop-Transcript