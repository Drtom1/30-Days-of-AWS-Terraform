resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1d2"
  instance_type = var.allowed_vm_types[1]
  region = var.regions[2]

  tags = var.tags
  lifecycle {
    create_before_destroy = true
    prevent_destroy = true
  }
}


