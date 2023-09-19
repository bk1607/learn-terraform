data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}

data "aws_caller_identity" "current" {}



resource "aws_spot_instance_request" "ec2" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  spot_type = "persistent"
  instance_interruption_behavior = "stop"
  tags = {
    Name = var.instance_name
  }
}

resource "aws_ec2_tag" "tags" {

  key         = "Name"
  resource_id = aws_spot_instance_request.ec2.spot_instance_id
  value       = var.instance_name
}

variable "instance_type" {}
variable "instance_name" {}
variable "sg_id" {}