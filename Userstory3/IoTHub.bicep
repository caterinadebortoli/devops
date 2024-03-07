param location string = resourceGroup().location
param name string
param sku_name string
param sku_capacity int
param d2cPartitions int = 4
param connectionstring string = 'DefaultEndpointsProtocol=https;AccountName=caterinastorage;AccountKey=T7Yppe/DH+qolddH3w6I97E6R/K/uBrjOOlDp8bRWeHjhZ2ETJv9gxF/YjRL/HPBDtnX4pXjWmty+AStG62OpA==;EndpointSuffix=core.windows.net'
param containerName string
param storageEndpoint string 

resource symbolicname 'Microsoft.Devices/IotHubs@2022-04-30-preview' = {
  name: name
  location: location
  sku: {
    capacity: sku_capacity
    name: sku_name
  }
  properties: {
    eventHubEndpoints: {
      events: {
        retentionTimeInDays: 1
        partitionCount: d2cPartitions
      }
    }
    routing:{
      endpoints:{
        storageContainers: [
          {

            connectionString: connectionstring
            containerName: containerName
            batchFrequencyInSeconds: 100
            maxChunkSizeInBytes: 104857600
            encoding: 'JSON'
            name: storageEndpoint
          }
        ]
      }
    }
}


}
