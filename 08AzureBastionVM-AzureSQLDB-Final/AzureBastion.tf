resource "azurerm_bastion_host" "r_bastion_host" {
  name                = "${var.App_Name}-bastion"
  location            = azurerm_resource_group.r_rg.location
  resource_group_name = azurerm_resource_group.r_rg.name

  ip_configuration {
    name                 = "${var.App_Name}-bastion-ip-config"
    subnet_id            = azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.r_public_ip_b.id
  }
}
