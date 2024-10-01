# Create a resource group
resource "azurerm_resource_group" "rg" {
  location = var.location
  name     = var.resource_group_name
}

# Create a virtual network
module "avm-res-network-virtualnetwork_example_default" {
  source  = "Azure/avm-res-network-virtualnetwork/azurerm"
  version = "0.4.0"
  
  # Defining our required variables
  resource_group_name = var.resource_group_name
  name                = var.vnet_name
  location            = var.location
  address_space       = var.address_space
}
