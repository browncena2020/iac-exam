import './modules/storage-accounts.bicep'

param deployApp bool

resource appServicePlan 'Microsoft.Web/serverfarms@2019-04-01' = {
    name: '<your name>-asp'
    location: resourceGroup().location
    sku: {
        name: 'B1'
    }
}

if deployApp {
    resource webApp 'Microsoft.Web/sites@2019-04-01' = {
        name: '<your name>-app'
        location: resourceGroup().location
        appServicePlanId: appServicePlan.id
        siteConfig: {
            appSettings: [
                {
                    name: 'MYSECRET'
                    value: '<your secret value>'
                }
            ]
        }
    }
}
