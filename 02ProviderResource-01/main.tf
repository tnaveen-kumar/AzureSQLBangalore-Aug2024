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

# Documentation about features block -> https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/guides/features-block

resource "azurerm_resource_group" "r_rg" {
  name     = "AzureSQLBangalore-01"
  location = "South India"
}
