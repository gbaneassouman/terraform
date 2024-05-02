# Get latest Ubuntu Linux Bionic 18.04 AMI
data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "mini_projet_terraform" {
  ami             = data.aws_ami.app_ami.id
  instance_type   = var.aws_instancetype
  key_name        = var.aws_key_name
  tags            = var.aws_common_tag
  security_groups = ["${var.aws_sg_name}"]

  provisioner "remote-exec" {
    inline = [ 
      "sudo apt  install -y nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl start nginx"
    ]
    connection {
    type = "ssh"
    user = var.username
    host = self.public_ip
    private_key = file("./files/${var.aws_key_name}.pem")
    }
  }
  
  root_block_device {
    delete_on_termination = true 
  }
}



