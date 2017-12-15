provider "aws" {
  region  = "eu-west-2"
  profile = "tpp"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

terraform {
  backend "s3" {
    bucket  = "tpp-terraform-state"
    key     = "tpp/terraform.tfstate"
    region  = "eu-west-2"
    encrypt = "true"
    profile = "tpp"
  }
}
