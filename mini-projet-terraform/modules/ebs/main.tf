resource "aws_ebs_volume" "ec2_instance_ebs" {
  availability_zone = var.ebs_zone
  size              = var.ebs_size
  tags              = var.ebs_common_tag
}