$storageAccName = ""
$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
$TemplateUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/azsptestfarm1template.json"
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $TemplateUri

New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile .\VSCode\AZSharepointTestFarm1\sqlservertemplate.json -TemplateParameterFile .\VSCode\AZSharepointTestFarm1\sqlserverparameters.json
#Remove-AzResourceGroup -Name $RGName -Force