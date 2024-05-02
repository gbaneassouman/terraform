provider "aws" {
  region     = var.region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}


module "ec2" {
  source = "../modules/ec2module"

  instancetype   = var.instancetype
  aws_common_tag = var.aws_common_tag
  aws_sg_name    = var.aws_sg_name

}