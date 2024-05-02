provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}

resource "aws_instance" "staging-ec2" {
  ami           = "ami-012cc038cc685a0d7"
  instance_type = "t2.micro"
  key_name      = "devops-gbane"
  tags = {
    Name = "staging"
  }
  root_block_device {
    delete_on_termination = true
  }
}
