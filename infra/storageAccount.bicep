// Parameters for Storage Account
@description('The name of the Storage Account. Must be globally unique and use Azure abbreviations.')
param storageAccountName string

@description('The Azure region to deploy the Storage Account.')
param location string = 'westus3'

@description('Resource tags following CAF best practices.')
param tags object

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: false
    supportsHttpsTrafficOnly: true
    encryption: {
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
      keySource: 'Microsoft.Storage'
    }
  }
  tags: tags
}

output storageAccountId string = storageAccount.id
