//określenie zakresu szablonu
targetScope = 'subscription'

//sekcja parametrów
param rgName string
param location string

//sekcja zasobów
resource resGrp 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: rgName
  location: location
}
