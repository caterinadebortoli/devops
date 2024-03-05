resource symbolicname 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: 'caterinastorage'
  location: 'West US'
  sku: {
    name: '	Standard_LRS'
  }
  kind: 'BlobStorage'
  properties: {
    accessTier: 'Cool'
    allowBlobPublicAccess: false
    allowCrossTenantReplication: true
    allowedCopyScope: 'AAD'
    allowSharedKeyAccess: true
  
  }
}
