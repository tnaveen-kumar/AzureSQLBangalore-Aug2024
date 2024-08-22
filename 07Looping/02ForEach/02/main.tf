provider "azurerm" {
    features {
    }
}

variable "rg_names" {
    type = map()
    default = {
        "DemoRG-01" = "South India"
        "DemoRG-02" = "Central India"
    }
}

resource "azurerm_resource_group" "r_rg_mame" {
  for_each = var.rg_names
  name = each.key
  location = each.value
}
