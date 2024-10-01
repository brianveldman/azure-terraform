variable "resource_group_name" {
  type    = string
  default = "rg-avm-terraform"
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the resource group"
}

variable "vnet_name" {
  type        = string
  default     = "vnet-avm-terraform"
  description = "The name of the virtual network"
}

variable "address_space" {
  type        = list(string)
  default     = [ "10.20.30.0/23" ]
  description = "The address space for the virtual network"
}
