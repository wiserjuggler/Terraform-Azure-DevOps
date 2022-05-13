terraform {
  cloud {
    organization = "vaultec"

    workspaces {
      name = "Default"
    }
  }
}

provider "azurerm" {
  version = 1.38
}

resource "azurerm_app_service_plan" "svcplan" {
  name                = "Test-asp"
  location            = "eastus"
  resource_group_name = "1-758661aa-playground-sandbox"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "Test_Webapp"
  location            = "eastus"
  resource_group_name = "1-758661aa-playground-sandbox"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
