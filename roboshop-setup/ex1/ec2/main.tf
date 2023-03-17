resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-068a20157a2378db8"]
  tags = {
    Name = var.component
  }
}

variable "instance_type" {}
variable "component" {}