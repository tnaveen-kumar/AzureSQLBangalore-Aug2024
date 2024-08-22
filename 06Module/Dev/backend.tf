terraform {
  backend "azurerm" {
    resource_group_name   = "terraform-backend-rg"
    storage_account_name  = "azsqlbangalore"
    container_name        = "dev"
    key                   = "terraform.tfstate"
  }
}