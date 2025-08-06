terraform {
  backend "azurerm" {
    resource_group_name  = "chha0038-githubactions-rg"
    storage_account_name = "chha0038githubactions"
    container_name       = "tfstate"
    key                  = "prod.app.tfstate"
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

