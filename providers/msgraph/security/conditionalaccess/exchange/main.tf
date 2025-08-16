resource "msgraph_resource" "ca_exo_require_mfa" {
  url = "identity/conditionalAccess/policies"
  body = {
    displayName = var.ca_display_name
    state       = "enabled"
    conditions  = {
      clientAppTypes = [
        "mobileAppsAndDesktopClients",
        "browser"
      ]
      applications = {
        includeApplications = [
          "00000002-0000-0ff1-ce00-000000000000" # Exchange Online
        ]
      }
      users = {
        includeGroups = [var.ca_group_id]
      }
      locations = {
        includeLocations = ["All"]
        excludeLocations = ["AllTrusted"]
      }
    }
    grantControls = {
      operator         = "OR"
      builtInControls = ["mfa"]
    }
  }
}
