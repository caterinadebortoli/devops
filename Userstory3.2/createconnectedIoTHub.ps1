# Load parameters from YAML file based on environment
$parametersFile = "<path of your parameters.yaml file>"
if (-not (Test-Path $parametersFile)) {
    Write-Error "Parameter file '$parametersFile' not found."
    exit
}

$parameters = Get-Content -Path $parametersFile | ConvertFrom-Yaml

# Azure login
Connect-AzAccount
$Subscription_Id= $parameters.subscription_id

Select-AzSubscription -SubscriptionId $Subscription_Id

# Create or select resource group
$resourceGroup = $parameters.resource_group
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
    Write-Error "Resource group $resourceGroup does not exist"
    exit

} else {
    Write-Host "Using existing resource group: $resourceGroup"
}


# Create IoTHub
# Parameters for Bicep template
$bicepParams = @{
    
    location= $parameters.location
    skuName= $parameters.skuName
    skuUnits=$parameters.skuUnits
    d2cPartitions= $parameters.d2cPartitions
    iotHubName= $parameters.iotHubName
    storageAccountName= $parameters.storageAccountName
    storageEndpoint= $parameters.storageEndpoint
    storageContainerName= $parameters.storageContainerName
    functionAppName= $parameters.functionAppName
    applicationInsightsName= $parameters.applicationInsightsName
    runtime= $parameters.runtime
    connectionString= $parameters.connectionString
    hostingPlanName= $parameters.hostingPlanName
}


New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "IoTHub.json" -TemplateParameterObject $bicepParams 


