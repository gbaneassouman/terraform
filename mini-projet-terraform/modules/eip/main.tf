resource "aws_eip" "ec2_lb" {
  domain   = "vpc"
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${self.public_ip} >> ip_ec2.txt"
  }
}

