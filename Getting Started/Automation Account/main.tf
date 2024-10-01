resource "azurerm_resource_group" "aa" {
  location = var.location
  name =  local.resource_group_name
}

resource "azurerm_automation_account" "name" {
  name                = "aa-automation-${var.environment}"
  location            = var.location
  resource_group_name = azurerm_resource_group.aa.name
  sku_name            = "Basic"
  identity {
    type = "SystemAssigned"
  }
}