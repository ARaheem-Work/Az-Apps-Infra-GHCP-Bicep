// Parameters for App Service
param appServiceName string
param location string = 'westus3'
param tags object = {
  ProjectName: 'GitHub Markdown Example'
  Environment: 'Dev'
  'Technical Owner': 'abdur.raheem@avanade.com'
}

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
