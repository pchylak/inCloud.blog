//sekcja parametrów
param vnetName string
param vnetAddrSpace string
param snet1AddrSpace string 
param snet2AddrSpace string
param snet3AddrSpace string  
param location string
//sekcja zmiennych
var snet2Name = 'AzureBastionSubnet'
var snet3Name = 'GatewaySubnet'
var snet1Name = 'default'

//sekcja zasobów
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
