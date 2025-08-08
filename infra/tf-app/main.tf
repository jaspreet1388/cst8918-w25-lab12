terraform {
  required_version = "~> 1.5"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "chha0038-githubactions-rg"
    storage_account_name = "chha0038githubactionslab"
    container_name       = "tfstate"
    key                  = "tf-app/terraform.tfstate"
    use_oidc             = true
    tenant_id            = "e39de75c-b796-4bdd-888d-f3d21250910c"
    client_id            = "873e0282-ef7e-4375-a2b0-e4559e242f1d"
    subscription_id      = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

variable "location" {
  type    = string
  default = "canadacentral"
}

variable "college_id" {
  type    = string
  default = "chha0038"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.college_id}-app-rg"
  location = var.location
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
