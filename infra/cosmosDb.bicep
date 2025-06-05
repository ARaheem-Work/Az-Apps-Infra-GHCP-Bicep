// Parameters for Cosmos DB
param cosmosDbAccountName string
param location string = 'westus3'
param tags object = {
  ProjectName: 'GitHub Markdown Example'
  Environment: 'Dev'
  'Technical Owner': 'abdur.raheem@avanade.com'
}

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: cosmosDbAccountName
  location: location
  kind: 'GlobalDocumentDB'
  properties: {
    databaseAccountOfferType: 'Standard'
    locations: [
      {
        locationName: location
        failoverPriority: 0
        isZoneRedundant: false
      }
    ]
    capabilities: [
      {
        name: 'EnableServerless'
      }
    ]
    enableFreeTier: true
    enableAutomaticFailover: false
    enableAnalyticalStorage: false
    enableMultipleWriteLocations: false
    isVirtualNetworkFilterEnabled: false
    publicNetworkAccess: 'Enabled'
  }
  tags: tags
}

output cosmosDbAccountId string = cosmosDbAccount.id
