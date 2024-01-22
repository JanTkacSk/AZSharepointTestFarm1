$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus

#Network and Domain Controller
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\azsptestfarm1template.json

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