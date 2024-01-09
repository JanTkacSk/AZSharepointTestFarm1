$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\azsptestfarm1template.json -storageAccName "stsp20240109130213"
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\admembertemplate.json
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\changeipstostatic.json