locals {
  prefix = terraform.workspace
}


variable "subnet_cidr_block" {
  description = "range of subnet ips "
  type        = string
}
variable "avail_zones" {
  description = "value for availability zone"
  type        = string
}
variable "route_table_cidr_block" {
  description = "value for route table cidr block"
}
variable "vpc_id" {
  description = "value for vpc_id"
  type = string
}


#  subnet variables.tf