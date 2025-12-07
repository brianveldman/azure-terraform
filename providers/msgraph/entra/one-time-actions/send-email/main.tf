resource "msgraph_resource_action" "send_welcome_email" {
  resource_url = "users/Jane@cloudtipsdemo.nl"
  action       = "sendMail"
  method       = "POST"

  body = {
    message = {
      subject = "Welcome to the organization!"
      body = {
        contentType = "HTML"
        content     = "<h1 style=\"font-family: Arial, sans-serif; font-size: 26px; color: #2c2c2c; margin-bottom: 10px;\">Welcome</h1><p style=\"font-family: Arial, sans-serif; font-size: 15px; color: #444444; line-height: 1.6; margin: 0 0 16px 0;\">We are very glad to have you join our team and we look forward to helping you get started.</p><div style=\"background-color: #f1f1f1; padding: 16px; border-radius: 6px; margin-bottom: 20px; font-family: Arial, sans-serif; font-size: 15px; color: #444444; line-height: 1.6;\">You will soon receive more information about your role, your access and the tools you will be working with. If you have any questions before then you can always contact your manager or our support team.</div><p style=\"font-family: Arial, sans-serif; font-size: 15px; color: #444444; line-height: 1.6; margin: 0 0 20px 0;\">We are looking forward to working with you and we hope you enjoy your first days here.</p><p style=\"font-family: Arial, sans-serif; font-size: 14px; color: #666666; margin: 0;\">Warm regards<br>The onboarding team</p>"
      }
      toRecipients = [
        {
          emailAddress = {
            address = "Jane@cloudtipsnl.onmicrosoft.com"
            name    = "Jane Doe"
          }
        }
      ]
    }
    saveToSentItems = true
  }
}
