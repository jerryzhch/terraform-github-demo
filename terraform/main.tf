terraform {
  backend "azurerm" {
    resource_group_name  = "wga-tfstate-rg"
    storage_account_name = "wgatfstatesa"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  # The "feature" block is required for AzureRM provider 2.x.
  # If you're using version 1.x, the "features" block is not allowed.
  version = "~>2.0"
  features {}
}

data "azurerm_client_config" "current" {}

#Create Resource Group
resource "azurerm_resource_group" "wgademorg" {
  name     = "wga-demo-rg"
  location = "eastus2"
}
