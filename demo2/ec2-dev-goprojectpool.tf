module "ec2_dev_goprojectpool_com" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "dev_goprojectpool"

  ami                         = "${data.aws_ami.ubuntu.id}"
  instance_type               = "t2.medium"
  key_name                    = "default"
  monitoring                  = false
  vpc_security_group_ids      = ["${module.tpp_sg.this_security_group_id}"]
  subnet_id                   = "${module.vpc.public_subnets[0]}"
  associate_public_ip_address = true

  root_block_device = [{
    volume_size = "20"
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
    Role = "discourse"
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get -y install python
              EOF
}
