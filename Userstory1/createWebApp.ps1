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
$parametersFile = "$PSScriptRoot\$Environment\_parameters.yaml"
if (-not (Test-Path $parametersFile)) {
    Write-Error "Parameter file '$parametersFile' not found."
    exit
}

$parameters = Get-Content -Path $parametersFile | ConvertFrom-Yaml

# Azure login
Connect-AzAccount

# Create or select resource group
$resourceGroup = $parameters.resource_group
if (-not (Get-AzResourceGroup -Name $resourceGroup -ErrorAction SilentlyContinue)) {
    New-AzResourceGroup -Name $resourceGroup -Location "West Europe"
} else {
    Write-Host "Using existing resource group: $resourceGroup"
}

# Create App Service Plan
$appServicePlan = $parameters.app_service_plan
if (-not (Get-AzAppServicePlan -Name $appServicePlan -ResourceGroupName $resourceGroup -ErrorAction SilentlyContinue)) {
    New-AzAppServicePlan -Name $appServicePlan -ResourceGroupName $resourceGroup -Location "West Europe" -Tier "Basic"
} else {
    Write-Host "Using existing App Service Plan: $appServicePlan"
}

# Deploy web app
$appName = $parameters.app_name
if (-not (Get-AzWebApp -Name $appName -ResourceGroupName $resourceGroup -ErrorAction SilentlyContinue)) {
    New-AzWebApp -Name $appName -ResourceGroupName $resourceGroup -Location "West Europe" -AppServicePlan $appServicePlan
    Write-Host "Web App created: $appName"
} else {
    Write-Host "Web App already exists: $appName"
}
