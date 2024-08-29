resource storageAccount 'Microsoft.Storage/storageAccounts@2021-01-01' = {
  name: '${name}-sa-${env}'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_GRS'
  }

  properties: {
    supportsHttpsTrafficOnly: false

    networkAcls: {
      bypass: 'None'
      defaultAction: 'Deny'
    }
  }

  resource configWeb 'config' = {
    name: 'web'

    properties: {
      minTlsVersion: '1.1'
      remoteDebuggingEnabled: true
    }
  }
}
