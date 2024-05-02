terraform {
  backend "s3" {
    bucket         = "gbane-state-bucket"
    region         = "us-east-1"
    key            = "staging-gbane.tfstate"
    access_key     = ""
    secret_key     = ""
    encrypt        = true
    dynamodb_table = "terraform-state-lock"
  }
}