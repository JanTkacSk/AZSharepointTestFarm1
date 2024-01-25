Start-Transcript C:\InstallADDS.txt
$PwdPlain = "PublicPassword123@!"
$PwdSecString = ConvertTo-SecureString -String $PwdPlain -AsPlainText -Force
Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName 'testground.eu' -InstallDNS -SafeModeAdministratorPassword $PwdSecString -Confirm:$false
Stop-Transcript