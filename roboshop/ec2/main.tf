data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}

data "aws_caller_identity" "current" {}

data "aws_security_group" "security" {
  name = "allow-all"


}

resource "aws_instance" "roboshop" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  security_groups = [data.aws_security_group.security.id]
  tags = {
    Name = var.instance_name
  }
}

variable "instance_type" {}
variable "instance_name" {}