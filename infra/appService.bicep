// Parameters for App Service
param appServiceName string
param location string = 'westus3'
@description('Resource tags following CAF best practices. Tags are passed from main.bicep.')
param tags object

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${appServiceName}-plan'
  location: location
  sku: {
    name: 'S1'
    tier: 'Standard'
  }
  kind: 'windows'
  tags: tags
}

resource appService 'Microsoft.Web/sites@2023-01-01' = {
  name: appServiceName
  location: location
  kind: 'app,windows'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
  tags: tags
}

output appServiceId string = appService.id
