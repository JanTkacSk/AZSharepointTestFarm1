$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus

#Virtual networks, ip interfaces, ips, nsgs, application groups
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\NetworkTemplate.json

#Domain controller VM and an extension to install the ADDS and domain.
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\DCTemplate.json

#User assigned managed identity, deployment and a new extension to create users
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\ExtensionTemplate.json

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