# Define Terraform provider
terraform {
  required_version = ">= 1.3"
  backend "azurerm" {
    resource_group_name  = "terraform"
    storage_account_name = "terraformremoteback"
    container_name       = "tfstate"
    key                  = "actions.tfstate"
  }
  required_providers {
    azurerm = {
      version = "~>3.2"
      source  = "hashicorp/azurerm"
    }
  }
}
# Configure the Azure provider
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "example" {
  name     = "azresume-challenge-grp"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  name                     = "azresumechallengestorage"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "example" {
  name                = "azresume-app-service-plan"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "example" {
  name                       = "azresume-function-app"
  resource_group_name        = azurerm_resource_group.example.name
  location                   = azurerm_resource_group.example.location
  app_service_plan_id        = azurerm_service_plan.example.id
  storage_account_name       = azurerm_storage_account.example.name
  storage_account_access_key = azurerm_storage_account.example.primary_access_key

  app_settings = {
    "FUNCTIONS_WORKER_RUNTIME"         = "python"
    "FUNCTIONS_EXTENSION_VERSION"      = "~3"
    "PYTHON_ENABLE_WORKER_EXTENSIONS" = "true"
    "WEBSITE_RUN_FROM_PACKAGE"        = "https://<your-package-url>.zip"
  }

  site_config {
    always_on = true
  }

  identity {
    type = "SystemAssigned"
  }

  depends_on = [
    azurerm_service_plan.example
  ]
}

resource "azurerm_function_app_host_keys" "example" {
  function_app_id = azurerm_function_app.example.id

  dynamic "host_keys" {
    for_each = ["master","function"]
    content {
      name  = host_keys.key
      value = host_keys.value
    }
  }
}

resource "azurerm_function_app_host_binding" "example" {
  function_app_id = azurerm_function_app.example.id
  name            = "HttpTrigger"
  type            = "httpTrigger"
  direction       = "in"
  auth_level      = "anonymous"
}
