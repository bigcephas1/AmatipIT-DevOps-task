
#  terraform block is useful for telling terraform the configurations to use, here I'm telling terraform to use s3 as remote storage for the terraform state file which is like the brain of terraform, this way it allows this terraform configuration files to be reused in any environment, also allows for better collaboration between teams

terraform {
  backend "s3" {
    bucket = "iamtestingtask"
    key    = "iamtestingtask/terraform.tfstate"
    region = "us-east-1"
  }
}


#  backend.tf file in root