import './modules/storage-accounts.bicep'

param deployApp bool

resource appServicePlan 'Microsoft.Web/serverfarms@2019-04-01' = {
    name: 'saadsahir-asp'
    location: resourceGroup().location
    sku: {
        name: 'B1'
    }
}

if deployApp {
    resource webApp 'Microsoft.Web/sites@2019-04-01' = {
        name: 'saadsahir-app'
        location: resourceGroup().location
        appServicePlanId: appServicePlan.id
        siteConfig: {
            appSettings: [
                {
                    name: 'MYSECRET'
                    value: '420'
                }
            ]
        }
    }
}
