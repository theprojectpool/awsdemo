provider "aws" {
  region  = "eu-west-2"
  profile = "tpp"
}

/*
terraform {
  backend "s3" {
    bucket = "tpptfstate"
    key    = "terraform.tfstate"
    region = "eu-west-2"
  }
}
*/

