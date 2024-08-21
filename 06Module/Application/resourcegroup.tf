resource "azurerm_resource_group" "r_rg_1" {
  name     = "${var.Env}-AzureSQLBangaloreRG" #var.RG_Name_1 
  location = "${var.RG_Location_1}"
  lifecycle {
    prevent_destroy = false
  }
}
