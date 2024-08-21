terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-backend-rg"
    storage_account_name  = "azsqlbangalore"
    container_name        = "container1"
    key                   = "terraform.tfstate"
  }
}