param location string
param tags object
param cosmosDbAccountName string

resource cosmosDbAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
  name: cosmosDbAccountName
  location: location
  kind: 'GlobalDocumentDB'
  tags: tags
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
    isVirtualNetworkFilterEnabled: false
    publicNetworkAccess: 'Enabled'
    enableMultipleWriteLocations: false
  }
}

output resourceId string = cosmosDbAccount.id
