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

variable "multiple_buckets" {
  description = "List of S3 bucket names to create"
  type = list(string)
  default = ["benadhen-terraform-bucket1", "benadhen-terraform-bucket2", "benadhen-terraform-bucket3"]
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

variable "ingress_rules" {
  description = "List of ingress rule objects"
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
    description = string
  }))
  default = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow HTTP traffic"
    },
    {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = [ "0.0.0.0/0" ]
      description = "HTTPS"
    }
  ]
  
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
variable "bucket_names" {
  description = "Set of S3 bucket names to create"
  type = list(string)
  default = ["benadhen-terraform-bucketA", "benadhen-terraform-bucketB", "benadhen-terraform-bucketC"]
  
}
variable "bucket_names_set" {
  description = "Set of S3 bucket names to create"
  type = set(string)
  default = ["benadhen-terraform-bucketX", "benadhen-terraform-bucketY", "benadhen-terraform-bucketZ"]
  
}
variable "regions" {
  description = "List of AWS regions"
  type        = list(string)
  default     = ["us-east-1", "us-west-2", "eu-west-1", "eu-north-1"]
  
}
variable "launch_template" {
  description = "Launch template configuration"
  type = object({
    name_prefix   = string
    image_id      = string
    instance_type = string
  })
  default = {
    name_prefix   = "app_server"
    image_id      = "ami-0c55b159cbfafe1d2"
    instance_type = "t3.micro"
  }
  
}