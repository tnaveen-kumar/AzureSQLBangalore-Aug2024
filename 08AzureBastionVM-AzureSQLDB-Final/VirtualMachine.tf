resource "azurerm_windows_virtual_machine" "r_vm" {
  name                  = "${var.App_Name}-vm"
  location              = azurerm_resource_group.r_rg.location
  resource_group_name   = azurerm_resource_group.r_rg.name
  network_interface_ids = [azurerm_network_interface.r_ni.id]
  #size                  = "Standard_DS1_v2"
  size                  = "Standard_D4lds_v5"

  os_disk {
    name              = "${var.App_Name}-os-disk"
    caching           = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

#az vm image list --all --publisher="MicrosoftSQLServer" --offer="sql2022-ws2022" --sku="sqldev-gen2"
  source_image_reference {
    publisher = "MicrosoftSQLServer"
    offer     = "sql2022-ws2022"
    sku       = "sqldev-gen2"
    version   = "latest"
  }

  admin_username = "AzSqlBangUser"
  admin_password = "ThisIsnot@StrongPassword1"
}