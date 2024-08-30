terraform {
  required_providers {
    azurerm = {source = "hashicorp/azurerm"
    version = "3.114.0"
    }
  }
}

provider "azurerm" {
    features {
    }
  
}

variable "rg_names" {
    type = list(string)
    default = ["RG01", "RG02"]
}

variable "rg_location" {
    default = "South India"
  
}

resource "azurerm_resource_group" "r_rg_mame" {
  count = length(var.rg_names)
  name = "${var.rg_names[count.index]}-resourcegroup"
  #name= var.rg_names[count.index]}
  location = var.rg_location
}
