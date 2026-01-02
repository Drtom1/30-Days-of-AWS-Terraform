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

variable "Environment" {
  description = "Name of env"
  type = string
  default = "Development"
}
variable "bucket_name" {
  description = "name of s3 bucket"
  type = string
  default = "benadhen-terraform-bucket12345"
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

#using local values
# Create a VPC
resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${local.vpc_name}"
  }
} 
output "vpc_id" {
  value = aws_vpc.example.id
}
output "s3_bucket_id" {
  value = aws_s3_bucket.abo-benadhen-big-bucket12345.id

}