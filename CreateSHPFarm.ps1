#Configuration Settings
$DatabaseServer = "vm-sql-shp-test"
$ConfigDatabase = "shp-t-1_config"
$AdminContentDB = "shp-t-1_admin"
$FarmAccountName = "Student"
$Password = "PublicPassword123@!"
$ServerRole="ApplicationWithSearch"

$Credentials = [PSCredential]::new($FarmAccountName, $(ConvertTo-SecureString -String $Password -AsPlainText -Force))
 
#Get the Farm Account Credentials
$Passphrase = (ConvertTo-SecureString $Password -AsPlainText -force)
   
#Create SharePoint Farm
Write-Host "Creating Configuration Database and Central Admin Content Database..."
New-SPConfigurationDatabase -DatabaseServer $DatabaseServer -DatabaseName $ConfigDatabase -AdministrationContentDatabaseName $AdminContentDB -Passphrase $Passphrase -FarmCredentials $Credentials -LocalServerRole $ServerRole
 
$Farm = Get-SPFarm -ErrorAction SilentlyContinue -ErrorVariable err 
if ($Farm -ne $null)
{
Write-Host "Installing SharePoint Resources..."
Initialize-SPResourceSecurity
  
Write-Host "Installing Farm Services ..."
Install-SPService
  
Write-Host "Installing SharePoint Features..."
Install-SPFeature -AllExistingFeatures
  
Write-Host "Creating Central Administration..."             
New-SPCentralAdministration -Port 2016 -WindowsAuthProvider NTLM
   
Write-Host "Installing Help..."
Install-SPHelpCollection -All 
  
Write-Host "Installing Application Content..."
Install-SPApplicationContent
   
Write-Host "SharePoint 2016 Farm Created Successfully!"
}


#Read more: https://www.sharepointdiary.com/2016/12/create-sharepoint-2016-farm-using-powershell.html#ixzz8PXGAwFtT