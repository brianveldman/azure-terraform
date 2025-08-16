resource "msgraph_resource" "w10_general_config" {
  url = "deviceManagement/deviceConfigurations"
  body = {
    "@odata.type" = "#microsoft.graph.windows10GeneralConfiguration"
    displayName   = "Defender - Device Configuration"
    description   = "Defender device configuration"
    defenderScanDownloads = true
    defenderBlockEndUserAccess = true
    defenderScanIncomingMail = true
    defenderScanRemovableDrivesDuringFullScan = true
    defenderScanMappedNetworkDrivesDuringFullScan = true
  }
}
