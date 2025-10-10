resource "msgraph_update_resource" "authorization_policy" {
  url = "policies/authorizationPolicy"

  body = {
    defaultUserRolePermissions = {
      allowedToCreateTenants = false
      allowedToCreateApps = false
      allowedToCreateSecurityGroups = false
    }
  }
}
