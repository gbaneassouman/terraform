provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.instancetype
  key_name        = var.aws_key_name
  tags            = var.aws_common_tag
  security_groups = ["${aws_security_group.allow_http_https.name}"]

  provisioner "remote-exec" {
    inline = [ 
      "sudo amazon-linux-extras install -y nginx1.12",
      "sudo systemctl start nginx" 
    ]
    connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("./devops-gb.pem")
    }
  }
  
  root_block_device {
    delete_on_termination = true
  }
}

resource "aws_eip" "lb" {
  instance = aws_instance.myec2.id
  domain   = "vpc"
  provisioner "local-exec" {
    command =  "echo PUBLIC IP: ${aws_eip.lb.public_ip}; ID: ${aws_instance.myec2.id} ; AZ: ${aws_instance.myec2.availability_zone} >> infos_ec2.txt"
  }
}

resource "aws_security_group" "allow_http_https" {
  name        = var.aws_sg_name
  description = "Allow HTTP inbound traffic"

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "HTTPS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "SSH from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_http_https"
  }
}