/*
  Web Servers
*/

resource "aws_security_group" "web" {
  name        = "vpc_web"
  description = "Allow incoming HTTP connections."

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 1433                           # SQL Server
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  egress {
    from_port   = 3306                           # MySQL
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["${var.private_subnet_cidr}"]
  }

  vpc_id = "${aws_vpc.default.id}"

  tags {
    Name = "WebServerSG"
  }
}

#resource "aws_instance" "web-1" {
#    ami = "${lookup(var.amis, var.aws_region)}"
#    availability_zone = "eu-west-2a"
#    instance_type = "t2.micro"
#    key_name = "${var.aws_key_name}"
#    vpc_security_group_ids = ["${aws_security_group.web.id}"]
#    subnet_id = "${aws_subnet.eu-west-2a-public.id}"
#    associate_public_ip_address = true
#    source_dest_check = false
#
#
#    tags {
#        Name = "Web Server 1"
#    }
#}


#resource "aws_eip" "web-1" {
#    instance = "${aws_instance.web-1.id}"
#    vpc = true
#}

