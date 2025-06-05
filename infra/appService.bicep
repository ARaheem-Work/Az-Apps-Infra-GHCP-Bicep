param location string
param tags object
param appServiceName string

resource appServicePlan 'Microsoft.Web/serverfarms@2023-01-01' = {
  name: '${appServiceName}-asp'
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
  tags: tags
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output resourceId string = appService.id
