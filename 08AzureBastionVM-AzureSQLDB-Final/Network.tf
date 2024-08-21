resource "azurerm_virtual_network" "r_vnet" {
  name                = "${var.App_Name}-network"
  address_space       = ["${var.App_vNet_CIDR}"]
  location            = azurerm_resource_group.r_rg.location
  resource_group_name = azurerm_resource_group.r_rg.name
}

resource "azurerm_subnet" "r_subnet_1" {
  name                 = "${var.App_Name}-subnet-1"
  resource_group_name  = azurerm_resource_group.r_rg.name
  virtual_network_name = azurerm_virtual_network.r_vnet.name
  address_prefixes     = ["${var.App_subnet1_CIDR}"]
}

resource "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.r_rg.name
  virtual_network_name = azurerm_virtual_network.r_vnet.name
  address_prefixes     = ["${var.App_bastion_CIDR}"]
}

resource "azurerm_public_ip" "r_public_ip_b" {
  name                = "${var.App_Name}-pip-bastion"
  location            = azurerm_resource_group.r_rg.location
  resource_group_name = azurerm_resource_group.r_rg.name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_network_security_group" "r_nsg" {
  name                = "${var.App_Name}-nsg"
  location            = azurerm_resource_group.r_rg.location
  resource_group_name = azurerm_resource_group.r_rg.name
}

resource "azurerm_network_security_rule" "r_nsr" {
  name                        = "allow-rdp"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.r_rg.name
  network_security_group_name = azurerm_network_security_group.r_nsg.name
}

resource "azurerm_network_security_rule" "r_sql_db_allow" {
  name                        = "allow_sql_access"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "1433"
  source_address_prefix       = "${var.App_subnet1_CIDR}"
  destination_address_prefix  = "${var.App_subnet1_CIDR}"
  resource_group_name         = azurerm_resource_group.r_rg.name
  network_security_group_name = azurerm_network_security_group.r_nsg.name
}

resource "azurerm_network_interface" "r_ni" {
  name                = "${var.App_Name}-nic"
  location            = azurerm_resource_group.r_rg.location
  resource_group_name = azurerm_resource_group.r_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.r_subnet_1.id
    private_ip_address_allocation = "Dynamic"
  }
}