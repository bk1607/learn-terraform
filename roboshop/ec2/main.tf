#data block to get ami_id of specified ami
data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}

#data block to get owner id to use in ami block
data "aws_caller_identity" "current" {}

#spot request resource
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

#this is used to create tags for spot requests
resource "aws_ec2_tag" "tags" {

  key         = "Name"
  resource_id = aws_spot_instance_request.ec2.spot_instance_id
  value       = var.instance_name
}

#variables should be defined
variable "instance_type" {}
variable "instance_name" {}
variable "sg_id" {}

#to get private_ip address of instances
output "pvt_ip" {
  value = aws_spot_instance_request.ec2.private_ip
}