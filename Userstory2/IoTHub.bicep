param location string = resourceGroup().location

resource symbolicname 'Microsoft.Devices/IotHubs@2022-04-30-preview' = {
  name: 'IotHub-caterinadb'
  location: location
  sku: {
    capacity: 100
    name: 'B1'
  }
}
