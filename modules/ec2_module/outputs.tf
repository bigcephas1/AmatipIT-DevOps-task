output "instance_public_ip" {
  value = aws_instance.AmatipIT_server.public_ip
}
#  add in ec2 outputs.tf