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
  location            = var.resource_location
  resource_group_name = var.resource_group_name

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "appsvc" {
  name                = "Test-Webapp"
  location            = var.resource_location
  resource_group_name = var.resource_group_name
  app_service_plan_id = azurerm_app_service_plan.svcplan.id


  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }
}
