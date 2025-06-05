targetScope = 'resourceGroup'

param location string = 'westus3'
param tags object
param appServiceName string
param cosmosDbAccountName string
param storageAccountName string

module appService 'appService.bicep' = {
  name: 'appServiceModule'
  params: {
    location: location
    tags: tags
    appServiceName: appServiceName
  }
}

module cosmosDb 'cosmosDb.bicep' = {
  name: 'cosmosDbModule'
  params: {
    location: location
    tags: tags
    cosmosDbAccountName: cosmosDbAccountName
  }
}

module storageAccount 'storageAccount.bicep' = {
  name: 'storageAccountModule'
  params: {
    location: location
    tags: tags
    storageAccountName: storageAccountName
  }
}

output appServiceResourceId string = appService.outputs.resourceId
output cosmosDbResourceId string = cosmosDb.outputs.resourceId
output storageAccountResourceId string = storageAccount.outputs.resourceId
