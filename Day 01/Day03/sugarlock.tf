terraform {
     backend "s3" {
    bucket = "thomas-terraform-state-1234567890"
    key    = "tom-terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create an S3 Bucket

resource "aws_s3_bucket" "initial_bucket" {
  bucket = "tom-bucket-1234567890"

  tags = {
    Name        = "Tom bucket"
    Environment = "Dev 1.1"
  }
}