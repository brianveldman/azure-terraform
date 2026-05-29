#Getting the Project in Azure DevOps
data "azuredevops_project" "sln_project" {
  name = var.azure_devops_project_name
}

data "msgraph_resource" "existing_app" {
  url = "applications(appId='${var.entra_application_id}')"

  response_export_values = {
    object_id = "id"
    app_id    = "appId"
  }
}
#Creating the Service Endpoint
resource "azuredevops_serviceendpoint_azurerm" "sln_service_connection_customer" {
  project_id                             = data.azuredevops_project.sln_project.id
  azurerm_spn_tenantid                   = var.entra_tenant_id
  service_endpoint_name                  = "CT-WIF-${var.customer}"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_subscription_id                = var.azure_subscription_id
  azurerm_subscription_name              = var.azure_subscription_name
  description = "WIF created for ${var.customer}"
}

#Creating the Federated Identity Credential on the existing Entra Application
resource "msgraph_resource" "sln_fic" {
  url = "applications/${data.msgraph_resource.existing_app.output.object_id}/federatedIdentityCredentials"
  body = {
    name      = "ado-${var.customer}-sln"
    issuer    = azuredevops_serviceendpoint_azurerm.sln_service_connection_customer.workload_identity_federation_issuer
    subject   = azuredevops_serviceendpoint_azurerm.sln_service_connection_customer.workload_identity_federation_subject
    audiences = ["api://AzureADTokenExchange"]
  }
}
