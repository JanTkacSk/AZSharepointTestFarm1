Start-Transcript  C:\CreateADUsers.txt
$PwdPlain = "PublicPassword123@!"
$PwdSecString = ConvertTo-SecureString -String $PwdPlain -AsPlainText -Force
New-ADuser -Name SPAdminAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SPServiceAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SQLServiceAcc -AccountPassword $PwdSecString -Enabled $true
Stop-Transcript