resource "aws_instance" "ec2" {
  ami = "ami-03265a0778a880afb"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.component
  }
}

output "private_ip" {
  value = aws_instance.ec2.private_ip
}


variable "instance_type" {}
variable "component" {}
variable "sg_id" {}

