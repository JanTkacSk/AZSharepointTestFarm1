$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\azsptestfarm1template.json
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\shpservertemplate.json -TemplateParameterFile .\shpserverparameters.json
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\sqlservertemplate.json -TemplateParameterFile .\sqlserverparameters.json
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\SetCustomDNSInVNET.json
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\admembertemplate.json