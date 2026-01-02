terraform {
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


#using input variables

resource "aws_s3_bucket" "abo-benadhen-big-bucket12345" {
    bucket = var.bucket_name
    
    tags = {
        Name        = "${var.Environment}-bucket"
        Environment = var.Environment
    }
}
locals {
  vpc_name= "${var.Environment}-vpc"
}




