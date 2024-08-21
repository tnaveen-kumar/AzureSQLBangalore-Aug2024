resource "azurerm_resource_group" "r_rg_1" {
  name     = "${var.RG_Name_1}" 
  location = "${var.RG_Location_1}"
}

resource "azurerm_resource_group" "r_rg_2" {
  name     = var.RG_Name_2
  location = var.RG_Location_2
}
