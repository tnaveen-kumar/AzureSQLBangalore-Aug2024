resource "azurerm_virtual_network" "r_Vnet" {
  name                = "${var.Env}-AzureSQLBangaloreVnet"
  location            = azurerm_resource_group.r_rg_1.location
  resource_group_name = azurerm_resource_group.r_rg_1.name
  address_space       = ["${var.vNet_CIDR}"]

}

resource "azurerm_subnet" "Public_Subnet" {
  name                 = "public"
  resource_group_name  = azurerm_resource_group.r_rg_1.name
  virtual_network_name = azurerm_virtual_network.r_Vnet.name
  address_prefixes     = ["${var.Public_Subnet_CIDR}"]
}

resource "azurerm_subnet" "Private_Subnet" {
  name                 = "private"
  resource_group_name  = azurerm_resource_group.r_rg_1.name
  virtual_network_name = azurerm_virtual_network.r_Vnet.name
  address_prefixes     = ["${var.Private_Subnet_CIDR}"]
}