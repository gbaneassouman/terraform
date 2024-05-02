provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

# Create EC2
module "ec2" {
  source = "../modules/ec2"
  aws_instancetype = "t2.micro"
  aws_sg_name = module.sg.ec2_security_group_id
  aws_public_ip = module.eip.ec2_eip
  
}

# Create EIP
module "eip" {
  source = "../modules/eip"

}

# Create EBS
module "ebs" {
  source = "../modules/ebs"
}
 
# Create Security Group
module "sg" {
  source = "../modules/sg"
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.ec2_ebs_id
  instance_id = module.ec2.ec2_id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.ec2.ec2_id
  allocation_id = module.eip.ec2_eip_id
}