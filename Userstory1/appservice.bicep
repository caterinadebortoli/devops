param location string = resourceGroup().location
param app_name string
param app_service_plan string 
param tier string


resource appServicePlan 'Microsoft.Web/serverfarms@2021-02-01' = {
  name: app_service_plan
  location: location
  sku: {
    name: 'B1'
    tier: tier
  }
}

resource appService 'Microsoft.Web/sites@2021-02-01' = {
  name: app_name
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}


