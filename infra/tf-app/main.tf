terraform {
  required_version = "~> 1.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.96.0"
    }
  }

  backend "azurerm" {
    # Remote state (from tf-backend you already applied)
    resource_group_name  = "chha0038-githubactions-rg"
    storage_account_name = "chha0038githubactionslab"
    container_name       = "tfstate"
    key                  = "tf-app/terraform.tfstate"

    # OIDC auth for backend
    use_oidc        = true
    tenant_id       = "e39de75c-b796-4bdd-888d-f3d21250910c"
    client_id       = "873e0282-ef7e-4375-a2b0-e4559e242f1d"
    subscription_id = "454cef6e-c0dd-444f-9766-2fcc4e902f67"
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
  # Helpful for CI where the SP only has Reader/Storage roles during plan
  skip_provider_registration = true
}

# ---------------------------- Vars ----------------------------
variable "location" {
  type    = string
  default = "canadacentral"
}

variable "college_id" {
  type    = string
  default = "chha0038"
}

variable "vnet_address_space" {
  description = "CIDR(s) for the VNet"
  type        = list(string)
  default     = ["10.10.0.0/16"]
}

variable "subnet_prefixes" {
  description = "CIDR(s) for the app subnet"
  type        = list(string)
  default     = ["10.10.1.0/24"]
}

# ------------------------- Resources --------------------------
resource "azurerm_resource_group" "rg" {
  name     = "${var.college_id}-app-rg"
  location = var.location

  tags = {
    env   = "lab12"
    app   = "tf-app"
    owner = var.college_id
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.college_id}-vnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = var.vnet_address_space

  tags = {
    env = "lab12"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "app-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.subnet_prefixes
}

# -------------------------- Outputs ---------------------------
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "subnet_name" {
  value = azurerm_subnet.subnet.name
}
