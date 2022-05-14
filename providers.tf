terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
   resource_group_name = "terraform-tftate-rg"
   storage_account_name = "terraformtfstate25475"
   container_name = "tfstate"
   key = "terraform.tfstate"
 }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
