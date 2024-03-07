# Azure login
Connect-AzAccount
$subscription_id = Read-Host 'Put your subscription id' 

Select-AzSubscription -SubscriptionId $subscription_id

# Create or select resource group
$resourceGroup = 'rg-caterina-debortoli'
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
    Write-Error "Resource group $resourceGroup does not exist"
    exit

} else {
    Write-Host "Using existing resource group: $resourceGroup"
}

# Create IoTHub
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "IoTHub.json" 


