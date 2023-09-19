terraform {
  backend "s3" {
    bucket = "terraform-state-bk"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}


data "aws_caller_identity" "current" {}


resource "aws_instance" "roboshop" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  tags = {
    Name = var.instance_name
  }
}

variable "instance_type" {}
variable "instance_name" {}