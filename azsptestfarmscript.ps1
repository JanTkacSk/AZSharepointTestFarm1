$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus

#Virtual networks, ip interfaces, ips, nsgs, application groups
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\ArmTemplates\10.NetworkTemplate.json

#Domain controller VM and an extension to install the ADDS and domain.
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\ArmTemplates\20.DCTemplate.json

#Remove VM extension InstallADDS-and-Forest
Remove-AzVMExtension "InstallADDS-and-Forest" -VMName "vm-dc-test-1" -Force -ResourceGroupName $RGName

#Add Users
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\ArmTemplates\21.CreateADUsers.json

#User assigned managed identity, deployment and a new extension to create users
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\ArmTemplates\30.SetCustomDnsInVNET.json

#Custom VNET DNS
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\SetCustomDNSInVNET.json

#SQL Server
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\sqlservertemplate.json -TemplateParameterFile .\sqlserverparameters.json

#Deploy a SharePoint App Server
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\shpservertemplate.json -TemplateParameterFile .\shpserverparameters.json

#Deploy a Sharepoint Web Server
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\shpservertemplate.json -TemplateParameterFile .\shpwebserverparameters.json 

#Generic Domain Member Server
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\admembertemplate.json