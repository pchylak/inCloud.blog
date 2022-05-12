## First template

Our first template will contain: 
- Resource group
- Azure Virtual Network

main.bicep file:
```azurecli
//scope of template
targetScope = 'subscription'

//parameters section
param location string 
param rgName string
param vnetName string
param vnetAddrSpace string
param snet1AddrSpace string 
param snet2AddrSpace string
param snet3AddrSpace string  

//modules section
module resourceGroup1 'rg.bicep' = {
  name: rgName
  params: {
    location: location
    rgName: rgName
  }
}

//reference to existing resource
resource resGrp 'Microsoft.Resources/resourceGroups@2021-04-01' existing = {
  name: rgName
}

module vNetwork 'vnet.bicep' = {
  name: rgName
  scope: resGrp
  params: {
    location: location
    vnetName: vnetName
    vnetAddrSpace: vnetAddrSpace
    snet1AddrSpace: snet1AddrSpace
    snet2AddrSpace: snet2AddrSpace
    snet3AddrSpace: snet3AddrSpace
  }
}
```
rg.bicep file:
```azurecli
//scope of template
targetScope = 'subscription'

//parameters section
param rgName string
param location string

//resources section
resource resGrp 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}
```

vnet.bicep file:
```azurecli
//parameters section
param vnetName string
param vnetAddrSpace string
param snet1AddrSpace string 
param snet2AddrSpace string
param snet3AddrSpace string  
param location string

//variables section
var snet2Name = 'AzureBastionSubnet'
var snet3Name = 'GatewaySubnet'
var snet1Name = 'default'

//resources section
resource vnet 'Microsoft.Network/virtualNetworks@2019-11-01' = {
    name: vnetName
    location: location
    properties: {
      addressSpace: {
        addressPrefixes: [
          vnetAddrSpace
        ]
      }
      subnets: [
        {
          name: snet1Name
          properties: {
            addressPrefix: snet1AddrSpace
          }
        }
        {
          name: snet2Name
          properties: {
            addressPrefix: snet2AddrSpace
          }
        }
        {
          name: snet3Name
          properties: {
            addressPrefix: snet3AddrSpace
          }
        }
      ]
    }
}
```

How to run deployment? <br/>
Azure Cli:
```azurecli
az deployment sub create \
    --name firstBicepDeployment \
    --subscription 'xxxx-yyyyy-zzzz-yyyy'
    --template-file main.bicep
    --parameters param1=value1 param2=value2
    --location westeurope
```

Powershell:
```azurepowershell
New-AzSubscriptionDeployment `
    -name firstBicepDeployment `
    -subscription 'xxxx-yyyy-zzzz-yyyy' `
    -templatefile main.bicep `
    -param1 value1 
    -param2 value2
```

in this example I used: 

```azurecli
az deployment sub create \
    --name firstBicepDeployment \
    --subscription 'xxxx-yyyyy-zzzz-yyyy'
    --template-file main.bicep
    --parameters location=westeurope rgName=azr-tst-rg vnetName=azr-tst-vnet-001 vnetAddrSpace=10.0.0.0/16 snet1AddrSpace=10.0.0.0/24 snet2AddrSpace=10.0.253.0/24 snet3AddrSpace=10.0.254.0/24
    --location westeurope
```