module "ec2_pioneer_skillinger_com" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name  = "pioneer.skillinger.com"

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
