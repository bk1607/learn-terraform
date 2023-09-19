resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.component
  }
}


variable "instance_type" {}
variable "component" {}
variable "sg_id" {}