module "Prod_App" {
  source        = "../Application"
  Env= "Dev"
  RG_Location_1 ="South India"
  vNet_CIDR = "10.110.0.0/16"
  Public_Subnet_CIDR = "10.110.1.0/24"
  Private_Subnet_CIDR = "10.110.2.0/24"
}
