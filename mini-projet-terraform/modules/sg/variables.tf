variable "aws_sg_name" {
  type        = string
  description = "set EC2 security group name"
  default     = "ec2-security-group"
}

variable "aws_sg_tag" {
  type        = map
  description = "set security group tag"
  default = {
    Name = "ec2-security-group-tag"
  }
}
