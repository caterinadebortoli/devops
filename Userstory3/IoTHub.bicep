param location string = resourceGroup().location
param name string
param sku_name string
param sku_capacity int


resource symbolicname 'Microsoft.Devices/IotHubs@2022-04-30-preview' = {
  name: name
  location: location
  sku: {
    capacity: sku_capacity
    name: sku_name
  }
  
}


