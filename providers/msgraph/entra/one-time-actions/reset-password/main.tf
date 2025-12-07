resource "msgraph_resource_action" "reset_user_password" {
  resource_url = "users/Jane@cloudtipsdemo.nl"
  action       = "changePassword"
  method       = "POST"

  body = {
    currentPassword = ""
    newPassword     = ""
  }
}
