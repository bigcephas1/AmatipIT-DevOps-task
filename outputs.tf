# output "instance_public_ip" {
#   value = module.tfdemo_ec2.instance_public_ip.public_ip
# }

#  this file is used to get outputs from a deployed infrastructure object for user reference or use in another module e.g Ip address that can be used for further accessing or configuring the server using tools like ansible 
output "instance_public_ip" {
  value = module.AmatipIT_server.instance_public_ip
}


# outputs.tf file in root