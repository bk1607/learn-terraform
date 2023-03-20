
resource "aws_security_group" "allow_tls" {
  count = length(var.instances)
  name        = "${var.instances.name}-dev-sg"
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
    Name = "${var.instances[count.index].name}-dev-sg"
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