targetScope = 'resourceGroup'

// Main Bicep file to orchestrate all modules
@description('The name of the App Service resource (Web App).')
param appServiceName string

@description('The name of the App Service Plan.')
param appServicePlanName string

@description('The name of the Azure Cosmos DB account.')
param cosmosDbAccountName string

@description('The name of the Azure Storage Account.')
param storageAccountName string

@description('The Azure region to deploy resources into.')
param location string = 'westus3'

@description('Resource tags to apply to all resources.')
param tags object

// Add module references for appService, cosmosDb, and storageAccount
module appService 'appService.bicep' = {
  name: 'appService'
  params: {
    location: location
    tags: tags
    appServicePlanName: appServicePlanName
    appServiceName: appServiceName
  }
}

module cosmosDb 'cosmosDb.bicep' = {
  name: 'cosmosDb'
  params: {
    location: location
    tags: tags
    cosmosDbAccountName: cosmosDbAccountName
  }
}

module storageAccount 'storageAccount.bicep' = {
  name: 'storageAccount'
  params: {
    location: location
    tags: tags
    storageAccountName: storageAccountName
  }
}

output appServiceResourceId string = appService.outputs.appServiceId
output cosmosDbResourceId string = cosmosDb.outputs.cosmosDbAccountId
output storageAccountResourceId string = storageAccount.outputs.storageAccountId
