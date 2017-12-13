module "ec2_dev_goprojectpool_com" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name = "dev.goprojectpool.com"

  ami                         = "ami-fcc4db98"
  instance_type               = "t2.micro"
  key_name                    = "default"
  monitoring                  = false
  vpc_security_group_ids      = ["${module.tpp_sg.this_security_group_id}"]
  subnet_id                   = "subnet-a9311dd2"
  associate_public_ip_address = true

  root_block_device = [{
    volume_size = "20"
  }]

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }

  user_data = <<-EOF
              #!/bin/bash
              wget -qO- https://get.docker.com/ | sh
              mkdir /var/discourse
              git clone https://github.com/discourse/discourse_docker.git /var/discourse
              EOF
}
