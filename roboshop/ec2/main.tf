#data block to get ami_id of specified ami
data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}

#data block to get owner id to use in ami block
data "aws_caller_identity" "current" {}

#create ec2 instance
resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.instance_name
  }
}



#variables should be defined
variable "instance_type" {}
variable "instance_name" {}
variable "sg_id" {}

#to get private_ip address of instances
output "pvt_ip" {
  value = aws_instance.ec2.private_ip
  depends_on = [aws_instance.ec2]
}

