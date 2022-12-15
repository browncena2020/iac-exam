param kind string
param accessTier string
param location string = resourceGroup().location
param storageAccountNames string[]

resource storageAccounts 'Microsoft.Storage/storageAccounts@2019-04-01' = {
    name: saadsahir-finalexam
    kind: kind
    location: location
    sku: {
        name: 'Standard_LRS'
        tier: accessTier
    }
}
