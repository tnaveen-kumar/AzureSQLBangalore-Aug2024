module "Prod_App" {
  source = "git::https://dev.azure.com/contactnaveent/AzureSQLBangalore-Aug/_git/AzureSQLBangalore-Aug//Terraform/Module/Application"
  Env= "Prod"
  RG_Location_1 ="South India"
  vNet_CIDR = "10.120.0.0/16"
  Public_Subnet_CIDR = "10.120.1.0/24"
  Private_Subnet_CIDR = "10.120.2.0/24"
}
