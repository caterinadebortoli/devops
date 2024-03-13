param (
    [string]$Environment
)

# Validate Environment parameter
$validEnvironments = @("dev", "test", "prod")
if (-not ($validEnvironments -contains $Environment)) {
    Write-Error "Invalid environment. Please specify one of the following environments: dev, test, prod"
    exit
}

# Load parameters from YAML file based on environment
$parametersFile = "$PSScriptRoot\${Environment}_parameters.yaml"
if (-not (Test-Path $parametersFile)) {
    Write-Error "Parameter file '$parametersFile' not found."
    exit
}

$parameters = Get-Content -Path $parametersFile | ConvertFrom-Yaml

# Azure login
Connect-AzAccount

$subscription_id = $parameters.subscription_id 

Select-AzSubscription -SubscriptionId $subscription_id

# Create or select resource group
$resourceGroup = $parameters.resource_group
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
     Write-Error "Resource group $resourceGroup does not exist"
     exit 
} else {
    Write-Host "Using existing resource group: $resourceGroup"
}

$appServicePlan = $parameters.app_service_plan
$tier = $parameters.tier
$appName = $parameters.app_name

$bicepParams = @{
    'app_name' = $appName
    'app_service_plan' = $appServicePlan
    'tier' = $tier
}


New-AzResourceGroupDeployment -ResourceGroupName $resourceGroup -TemplateFile "appservice.json" -TemplateParameterObject $bicepParams -Location "West Europe"