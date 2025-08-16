resource "msgraph_resource" "team" {
  url = "teams"
  body = {
    "template@odata.bind" = "https://graph.microsoft.com/v1.0/teamsTemplates('standard')"
    displayName = var.teams_displayName
    description = var.teams_description
    members = [
      {
        "@odata.type"     = "#microsoft.graph.aadUserConversationMember"
        roles             = ["owner"]
        "user@odata.bind" = "https://graph.microsoft.com/v1.0/users('${var.teams_owner_id}')"
      }
    ]
  }
}
