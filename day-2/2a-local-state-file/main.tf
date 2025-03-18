provider "azurerm" {
  subscription_id = "b19e47e5-a91e-485e-885b-5d2471405f35"
  client_id       = "dd2effbd-e591-4d76-ac94-314a36ab3e3f"
  client_secret   = "eb645fcc-0397-4996-ad2f-284fc5d31f01"
  tenant_id       = "a0b3fea9-510d-46b2-a3ea-afb52c7c0c63"
  features {}
}
  features {
    
  }
}

resource "azurerm_resource_group" "example" {
  name                      = local.resource_group_name
  location                  = var.location
}

resource "azurerm_storage_account" "example" {
  name                      = local.storage_account_name
  resource_group_name       = azurerm_resource_group.example.name
  location                  = var.location
  account_tier              = "Standard"
  account_replication_type  = "LRS"
}

resource "azurerm_servicebus_namespace" "example" {
  name                      = local.servicebus_namespace_name
  location                  = var.location
  resource_group_name       = azurerm_resource_group.example.name
  sku                       = "Standard"
}
