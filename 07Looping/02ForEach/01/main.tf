provider "azurerm" {
    features {
    }
}

variable "rg_names" {
    type = set(string)
    default = ["RG01", "RG02","RG02"]
}

variable "rg_location" {
    default = "South India"
}

resource "azurerm_resource_group" "r_rg_mame" {
  for_each = var.rg_names
  name = each.value
  location = var.rg_location
}
