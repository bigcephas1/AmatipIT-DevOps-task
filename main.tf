#  define a provider or providers to use, I'm more comfortable with aws
provider "aws" {
  region = "us-east-1"

}


# useful for defining variables that can be used across multiple environments 
locals {
    #  using the current terraform workspace environment to prefix any resource provisioned
  prefix = terraform.workspace
}

#  create a vpc resource (resources are objects or parts of infrastructure you want to create in a particular provider
resource "aws_vpc" "AmatipIT_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${local.prefix}-vpc"
  }
}


#  referencing  modules created in the modules directory( i'm using a custom module for better control, I could also use existing modules from Terraform registry ) note all the values gotten from variables here can be assigned or hardcoded here but it's always a best practice to assign variables where necessary and not hardcode everything making them dynamic and reusable 

module "AmatipIT_subnet" {
  source                 = "./modules/subnet_module"
#   referencing the vpc resource directly because they're in the same file
  vpc_id                 = aws_vpc.AmatipIT_vpc.id
  subnet_cidr_block      = var.subnet_cidr_block
  avail_zones            = var.avail_zones
  route_table_cidr_block = var.route_table_cidr_block
}

module "AmatipIT_server" {
  source                = "./modules/ec2_module"
  ingress_sg_cidr_block = var.ingress_sg_cidr_block
  avail_zones           = var.avail_zones
  instance_type         = var.instance_type
  #   referencing the vpc resource directly because they're in the same file
  vpc_id                = aws_vpc.AmatipIT_vpc.id
  subnet_id             = module.AmatipIT_subnet.subnet_id

}


#  main.tf file in root

