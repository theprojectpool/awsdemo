provider "aws" {
  region  = "eu-west-2"
  profile = "tpp"
}

terraform {
  backend "s3" {
    bucket = "tpp-terraform-state"
    key    = "tpp/terraform.tfstate"
    region = "eu-west-2"
    encrypt = "true"
    profile = "tpp"
  }
}
