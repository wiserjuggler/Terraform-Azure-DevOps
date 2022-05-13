terraform {
  cloud {
    organization = "vaultec"

    workspaces {
      name = "Default"
    }
  }
}

resource "azurerm_app_service_plan" "svcplan" {
  name                = "Test-asp"
  location            = "eastus"
  resource_group_name = "Terraform"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "Test-Webapp"
  location            = "eastus"
  resource_group_name = "Terraform"
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
