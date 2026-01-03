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
#example of number, bool variables
variable "instance_count" {
  description = "Number of EC2 instances"
  type = number
  default = 1
}
variable "monitoring_enabled" {
  description = "Enable detailed monitoring for EC2 instances"
  type = bool
  default = true
}
variable "associate_public_ip_address" {
  description = "associate public IP address with EC2 instances"
  type = bool
  default = true
}
#example of list, map, tuple, object variables
variable "cidr_block" {
  description = "CIDR block for the VPC"
  type = list(string)
  default = ["10.0.0.0/16", "10.1.0.0/16", "10.2.0.0/16"]
}

variable "allowed_vm_types" {
  description = "List of allowed VM types"
  type        = list(string)
  default     = ["t2.micro", "t3.micro", "t3a.micro"]
  
}
variable "allowed_regions" {
  description = "List of allowed AWS regions"
  type        = list(string)
  default     = ["us-east-1", "us-west-2", "eu-west-1", "eu-north-1"]
  
}

variable "tags" {
  type = map(string)
  default = {
    Name = "HelloWorld"
    Environment = "senior_developer"
    created_by = "terraform"
  }
} 
variable "ingress_values" {
  type = tuple([number, string, number])
  default = [443, "tcp", 443]
}
variable "configs" {
  type = object({
    instance_count = number
    region         = string
     
  })
  default = {
    instance_count = 2
    region = "us-east-1"
  }
}
