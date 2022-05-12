//określenie zakresu szablonu
targetScope = 'subscription'

//sekcja parametrów
param location string 
param rgName string
param vnetName string
param vnetAddrSpace string
param snet1AddrSpace string 
param snet2AddrSpace string
param snet3AddrSpace string  

//sekcja modułów
module resourceGroup1 'rg.bicep' = {
  name: rgName
  params: {
    location: location
    rgName: rgName
  }
}

//referencja do instniejącego wcześniej utworzonego zasobu
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

