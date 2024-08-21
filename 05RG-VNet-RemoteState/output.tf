output "Public_Subnet_CIDR_Range" {
  value = azurerm_subnet.r_subnet_1.address_prefixes
  }

output "Private_Subnet_CIDR_Range" {
  value = [azurerm_subnet.r_subnet_2.name, azurerm_subnet.r_subnet_2.address_prefixes]
  }