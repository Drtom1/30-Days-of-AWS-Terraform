
# CONDITIONAL RESOURCE CREATION BASED ON ENVIRONMENT VARIABLE
resource "aws_instance" "conditional_instance" {
    ami = "ami-0130c3a072f3832ff"
    instance_type = var.Environment == "production" ? "t2.large" : "t3.micro"
    tags = var.tags

}
# DYNAMIC BLOCKS
resource "aws_security_group" "dynamic_sg" {
    name = "dynamic-sg-${var.Environment}"
    description = "Security group with dynamic ingress rules"

    # Create multiple ingress rules from a list
    dynamic "ingress" {
        for_each = var.ingress_rules
        content {
            from_port = ingress.value.from_port
            to_port   = ingress.value.to_port
            protocol  = ingress.value.protocol
            cidr_blocks = ingress.value.cidr_blocks
            description = ingress.value.description
        }

      
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]

  
}
tags = var.tags
}

resource "aws_instance" "splat_example" {
    count = var.instance_count
    ami = "ami-0130c3a072f3832ff"
    instance_type = "t2.micro"
    tags = {
        name = "splat-instance-${count.index + 1}"
    }
}

# use splat expression to get all instance IDs
locals{
    instance_ids = aws_instance.splat_example[*].id
}