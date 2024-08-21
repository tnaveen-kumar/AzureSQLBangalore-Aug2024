variable "RG_Name_1" {
  description = "Enter the resource group name"
  default = "AzureSQLBangalore-03"
}

variable "RG_Location_1" {
  description = "Enter the resource group location"
  default = "South India"
  
}

resource "azurerm_resource_group" "r_rg_1" {
  name     = "${var.RG_Name_1}" 
  location = "${var.RG_Location_1}"
}

