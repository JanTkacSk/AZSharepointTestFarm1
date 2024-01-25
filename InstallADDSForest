Start-Transcript C:\InstallADDSForest.txt
$PwdPlain = "PublicPassword123@!"
$PwdSecString = ConvertTo-SecureString -String $PwdPlain -AsPlainText -Force
Install-ADDSForest -DomainName 'testground.eu' -InstallDNS -SafeModeAdministratorPassword $PwdSecString -Confirm:$false
Stop-Transcript