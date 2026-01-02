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