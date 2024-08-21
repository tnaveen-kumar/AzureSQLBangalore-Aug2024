resource "azurerm_resource_group" "r_rg_1" {
  name     = var.RG_Name_1 
  location = var.RG_Location_1
  lifecycle {
    prevent_destroy = false
  }
}


resource "azurerm_virtual_network" "r_Vnet" {
  name                = var.VNet_Name
  location            = azurerm_resource_group.r_rg_1.location
  resource_group_name = azurerm_resource_group.r_rg_1.name
  address_space       = ["10.10.0.0/16"]

}

resource "azurerm_subnet" "r_subnet_1" {
  name                 = "public"
  resource_group_name  = azurerm_resource_group.r_rg_1.name
  virtual_network_name = azurerm_virtual_network.r_Vnet.name
  address_prefixes     = ["10.10.10.0/24"]
}

resource "azurerm_subnet" "r_subnet_2" {
  name                 = "private"
  resource_group_name  = azurerm_resource_group.r_rg_1.name
  virtual_network_name = azurerm_virtual_network.r_Vnet.name
  address_prefixes     = ["10.10.20.0/24"]
}


output "Public_Subnet_CIDR_Range" {
  value = azurerm_subnet.r_subnet_1.address_prefixes
  }

output "Private_Subnet_CIDR_Range" {
  value = [azurerm_subnet.r_subnet_2.name, azurerm_subnet.r_subnet_2.address_prefixes]
  }
