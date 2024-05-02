variable "instancetype" {
  type        = string
  description = "definir le type de l'instance"
  default     = "t2.nano"
}

variable "aws_common_tag" {
  type        = map(any)
  description = "definir le tag de l'image"
  default = {
    Name = "ec2-dev-gbane"
  }
}

variable "region" {
  type        = string
  description = "set aws region"
  default     = "us-east-1"
}

variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}

variable "aws_key_name" {
  type    = string
  default = "devops-gbane"
}

variable "aws_sg_name" {
  type        = string
  description = "set Dev security group name"
  default     = "dev-gbane-sg"

}

variable "aws_tfstate" {
  type        = string
  description = "Dev tfstate"
  default     = "dev-gbane.tfstate"
}

variable "aws_s3" {
  type        = string
  description = "Dev S3"
  default     = "gbane-state-bucket"
}