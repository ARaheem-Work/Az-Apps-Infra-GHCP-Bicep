// Parameters for Storage Account
param storageAccountName string
param location string = 'westus3'
param tags object = {
  ProjectName: 'GitHub Markdown Example'
  Environment: 'Dev'
  'Technical Owner': 'abdur.raheem@avanade.com'
}

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
