variable "location" {
  type = string
  default = "westeurope"
  description = "Define your Azure location for the resources"
}

variable "environment" {
  type = string
  default = "prod"
  description = "Define your deployment environment"
}