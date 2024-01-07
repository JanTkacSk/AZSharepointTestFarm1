#$storageAccName = ""
$RGName = "rg-shp-test-eus-1"
New-AzResourceGroup $RGName -Location eastus

New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile azsptestfarm1template.json -AsJob
New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile admembertemplate.json

New-AZResourceGroupDeployment -ResourceGroupName $RGName -TemplateFile changeipstostatic.json
#Remove-AzResourceGroup -Name $RGName -Force