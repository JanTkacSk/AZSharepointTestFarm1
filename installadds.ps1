Start-Transcript C:\transcript.txt
$PwdPlain = "PublicPassword123@!"
$PwdSecString = ConvertTo-SecureString -String $PwdPlain -AsPlainText -Force
Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName 'testground.eu' -InstallDNS -SafeModeAdministratorPassword $PwdSecString -Confirm:$false
Start-Sleep -Seconds 120
New-ADuser -Name SPAdminAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SPServiceAcc -AccountPassword $PwdSecString -Enabled $true
New-ADuser -Name SQLServiceAcc -AccountPassword $PwdSecString -Enabled $true
Stop-Transcript