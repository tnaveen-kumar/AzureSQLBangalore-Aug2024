resource "azurerm_resource_group" "r_rg" {
  name     = "${var.App_Name}-Demo"
  location = "${var.App_location}"
}