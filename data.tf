#  data block is used to query existing resources from the specified provider(s)

data "aws_ami" "AmatipIT-server_ami" {
    #  querying to get the latest ami(amazon machine image) to use for the ami value in the instance resource block, this way we don't have to hardcode the value for ami, so that if the default machine image changes in the future we'd always get the latest ami  
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["Ubuntu*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
#  data.tf file in root