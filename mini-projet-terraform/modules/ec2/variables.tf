variable "aws_instancetype" {
  type        = string
  description = "definir le type de l'instance"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map
  description = "definir le tag de l'image"
  default = {
    Name = "ec2-mini-projet-terraform"
  }
}

variable "aws_key_name" {
  type    = string
  default = "devops-gbane"
}

variable "aws_sg_name" {
  type        = string
  description = "Security Group"
  default     = "NULL"
}

variable "aws_public_ip" {
  type = string
  description = "set public ip"
  default = "eip-mini-projet-terraform"
}

variable "username" {
  type = string
  default = "ubuntu"
}