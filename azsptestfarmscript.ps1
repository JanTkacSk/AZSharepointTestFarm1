$storageAccName = ""
$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
$TemplateUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/azsptestfarm1template.json"
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $TemplateUri

$ParameterFileUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/sqlserverparameters.json"
$TemplateFileUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/sqlservertemplate.json"
$TemplateFile = ".\VSCode\AZSharepointTestFarm1\sqlservertemplate.json"
$ParameterFile = ".\VSCode\AZSharepointTestFarm1\sqlserverparameters.json"

New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile $TemplateUri -TemplateParameterFile $ParameterFile
#Remove-AzResourceGroup -Name $RGName -Force