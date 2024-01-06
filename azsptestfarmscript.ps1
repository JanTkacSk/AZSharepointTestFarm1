#$storageAccName = ""
$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
$TemplateFileUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/azsptestfarm1template.json"
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $TemplateFileUri

#$SQLParameterFileUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/sqlserverparameters.json"
#$SQLTemplateFileUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/sqlservertemplate.json"
#$ADMemberTemplateUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/admembertemplate.json"
$ChangeIpsToStaticUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/changeipstostatic.json"
#TemplateFile = ".\VSCode\AZSharepointTestFarm1\sqlservertemplate.json"
#$ParameterFile = ".\VSCode\AZSharepointTestFarm1\sqlserverparameters.json"

#New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $TemplateFileUri -TemplateParameterUri $ParameterFileUri
#New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $ADMemberTemplateUri
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile changeipstostatic.json
#Remove-AzResourceGroup -Name $RGName -Force