variable "solution" {
  type = string
  default = "cloud-infra"
  description = "The solution name"
}

variable "ado_project_visibility" {
  type = string
  default = "private"
  description = "The visibility of the Azure DevOps project"
}

variable "ado_version_control" {
  type = string
  default = "Git"
  description = "The version control system for the Azure DevOps project"
}

variable "ado_work_item_template" {
  type = string
  default = "Agile"
  description = "The work item template for the Azure DevOps project"
}

variable "ado_repository_name" {
  type = string
  default = "migrations"
  description = "The name of the Azure DevOps repository"
}