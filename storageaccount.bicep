resource symbolicname 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'caterinastorage'
  location: 'West US'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'BlobStorage'
  properties: {
    accessTier: 'Cool'
    allowBlobPublicAccess: true
    allowCrossTenantReplication: true
    allowedCopyScope: 'AAD'
    allowSharedKeyAccess: true
  
  }
}
resource blobContainer 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  name: '${symbolicname.name}/default/container' 
  properties: {
    publicAccess: 'Blob'
  }
}

