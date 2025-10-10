data "msgraph_resource" "authorization_policy" {
  url = "policies/authorizationPolicy"
  response_export_values = {
    all = "@"
  }
}

resource "local_file" "authorization_policy_dump" {
  filename = "${path.module}/authorizationPolicy.json"
  content  = jsonencode(data.msgraph_resource.authorization_policy.output.all)
}
