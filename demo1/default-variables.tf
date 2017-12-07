variable "aws_region" {
  default = "eu-west-2"
}

variable "aws_key_name" {
  default = "default"
}

variable "aws_profile" {
  default = "tpp"
}

variable "server_port" {
  default = 8080
}

variable "amis" {
  type = "map"

  default = {
    "eu-west-1" = "ami-d7b9a2b1"
    "eu-west-2" = "ami-fcc4db98"
    "us-east-1" = "ami-b374d5a5"
    "us-west-2" = "ami-4b32be2b"
  }
}

variable "vpc_cidr" {
  description = "CIDR for the whole VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for the Public Subnet"
  default     = "10.0.0.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for the Private Subnet"
  default     = "10.0.1.0/24"
}
