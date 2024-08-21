resource "azurerm_mssql_server" "r_sql_server" {
  name                         = "azsqlbangserver"
  resource_group_name          = "${azurerm_resource_group.r_rg.name}"
  location                     = "${azurerm_resource_group.r_rg.location}"
  version                      = "12.0"
  administrator_login          = "azsqlbanguser"
  administrator_login_password = "Password@#4321"
  public_network_access_enabled = true ##New Code
}

resource "azurerm_mssql_database" "r_sql_database" {
  name                = "azsqlbangdb"
  server_id = "${azurerm_mssql_server.r_sql_server.id}"
  max_size_gb = 5
  transparent_data_encryption_enabled = true
  tags = {
    environment = "UG-Meet"
  }
}

resource "azurerm_mssql_firewall_rule" "r_mssql_firewall_rule" {
  name             = "${var.App_Name}-FirewallRule1"
  server_id        = azurerm_mssql_server.r_sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
