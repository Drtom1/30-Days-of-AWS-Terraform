
data "aws_vpc" "shared" {
  filter {
    name = "tag:Name"
    values = ["default"]
  }
}

data "aws_subnet" "shared" {
  filter {
    name = "tag:Name"
    values = ["subnet_dT"]
  
}
vpc_id = data.aws_vpc.shared.id
}

data "aws_ami" "linux2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
  
}

resource "aws_instance" "smoothie" {
    ami = data.aws_ami.linux2.id
    instance_type = "t2.large"
    subnet_id = data.aws_subnet.shared.id
    tags = var.tags

}