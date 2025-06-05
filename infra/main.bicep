targetScope = 'resourceGroup'

// Main Bicep file to orchestrate all modules
param appServiceName string
param cosmosDbAccountName string
param storageAccountName string
param location string = 'westus3'
param tags object = {
  ProjectName: 'GitHub Markdown Example'
  Environment: 'Dev'
  'Technical Owner': 'abdur.raheem@avanade.com'
}

// Add module references for appService, cosmosDb, and storageAccount
module appService 'appService.bicep' = {
  name: 'appServiceModule'
  params: {
    appServiceName: appServiceName
    location: location
    tags: tags
  }
}

module cosmosDb 'cosmosDb.bicep' = {
  name: 'cosmosDbModule'
  params: {
    cosmosDbAccountName: cosmosDbAccountName
    location: location
    tags: tags
  }
}

module storageAccount 'storageAccount.bicep' = {
  name: 'storageAccountModule'
  params: {
    storageAccountName: storageAccountName
    location: location
    tags: tags
  }
}

output appServiceId string = appService.outputs.appServiceId
output cosmosDbAccountId string = cosmosDb.outputs.cosmosDbAccountId
output storageAccountId string = storageAccount.outputs.storageAccountId
