# Define Terraform provider
terraform {
  required_providers {
    azurerm = "2.52.0"
  }
}
# Configure the Azure provider
provider "azurerm" { 
  environment = "public"
  version = ">= 2.0.0"
  features {}  
}
