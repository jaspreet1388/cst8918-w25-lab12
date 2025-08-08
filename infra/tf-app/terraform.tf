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
