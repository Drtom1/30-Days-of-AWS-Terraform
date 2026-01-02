 terraform {
 backend "s3" {
    bucket = "thomas-terraform-state-1234567890"
    key    = "tom-terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
 }