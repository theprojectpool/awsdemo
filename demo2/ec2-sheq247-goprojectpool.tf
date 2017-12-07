module "ec2_sheq247_goprojectpool_com" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "sheq247.goprojectpool.com"

  ami                    = "ami-fcc4db98"
  instance_type          = "t2.micro"
  key_name               = "default"
  monitoring             = false
  vpc_security_group_ids = ["${module.tpp_sg.this_security_group_id}"]
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
