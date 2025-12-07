resource "msgraph_resource_action" "block_existing_user" {
  resource_url = "users/Jane@cloudtipsdemo.nl"
  method       = "PATCH"
  body = {
    accountEnabled = false
  }
}

output "block_user_result" {
  value = msgraph_resource_action.block_existing_user.output
}
