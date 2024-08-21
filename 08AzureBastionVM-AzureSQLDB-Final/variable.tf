variable "App_Name" {
    description = "Define your application name. This name will be added as a prefix for all the resources"
    type = string
}

variable "App_location" {
  description = "Enter your application location"
  default = "South India"
}

variable "App_vNet_CIDR" {
  description = "Provide the virtual network CIDR range"
}

variable "App_subnet1_CIDR" {
   description = "Provide the subnet1a CIDR range"
}

variable "App_bastion_CIDR" {
   description = "Provide the subnet1a CIDR range"
}