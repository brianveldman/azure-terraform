variable "customer" {
  type        = string
  default     = "XYZ"
  description = "Customer Name"
  nullable    = false
}

variable "azure_devops_project_name" {
  type        = string
  default     = ""
  description = "Azure DevOps Project Name"
  nullable    = false
}

variable "azure_subscription_name" {
  type        = string
  default     = ""
  description = "Azure Subscription Name"
  nullable    = false
}

variable "azure_subscription_id" {
  type        = string
  default     = ""
  description = "Azure Subscription ID"
  nullable    = false
}

variable "entra_application_id" {
  type        = string
  default     = ""
  description = "Entra Application ID"
  nullable    = false
}

variable "entra_tenant_id" {
  type        = string
  default     = ""
  description = "Entra Tenant ID"
  nullable    = false
}
