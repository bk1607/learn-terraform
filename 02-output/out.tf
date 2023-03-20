
resource "aws_security_group" "allow_tls" {
  for_each = var.instances
  component = each.value["name"]
  name = "${component}-dev-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    description      = "TLS from VPC"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${component}-dev-sg"
  }
}

//output "sg_id" {
//  value = aws_security_group.allow_tls.id
//}

variable "instances" {
  default = {
    frontend = {
      name = "frontend"
    }
    catalogue = {
      name = "catalogue"
    }
    user = {
      name = "user"
    }
  }
}