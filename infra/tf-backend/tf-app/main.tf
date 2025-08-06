provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "chha0038-a12-rg"
  location = "canadacentral"
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

