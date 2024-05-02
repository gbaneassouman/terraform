variable "ebs_zone" {
  type        = string
  description = "Set EBS Zone"
  default     = "us-east-1b"
}

variable "ebs_size" {
  type        = number
  description = "Set EBS Size"
  default     = 8
}


variable "ebs_common_tag" {
  type        = map
  description = "Set EBS Tag"
  default = {
    Name  = "ebs-mini-projet-terraform"
  }
}
