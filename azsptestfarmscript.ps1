$storageAccName = ""
$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus
$TemplateUri = "https://raw.githubusercontent.com/JanTkacSk/AZSharepointTestFarm1/main/azsptestfarm1.json"
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateUri $TemplateUri
#Remove-AzResourceGroup -Name $RGName -Force