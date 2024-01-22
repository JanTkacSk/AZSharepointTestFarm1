Add-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName 'testground.eu' -InstallDNS -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText 'PublicPassword123@!' -Force) -Confirm:$false
$UserName = "testground.eu\Student"
$Password = "PublicPassword123@!"
$Credential = [PSCredential]::new($UserName, $(ConvertTo-SecureString -String $Password -AsPlainText -Force))
New-ADuser -Name SPAdminAcc -Credential $Credentials
New-ADuser -Name SPServiceAcc -Credential $Credentials
New-ADuser -Name SQLServiceAcc -Credential $Credentials