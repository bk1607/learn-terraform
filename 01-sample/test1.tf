resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami_id.image_id
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-068a20157a2378db8"]
  tags = {
    Name = "test"
  }
}

data "aws_ami" "ami_id" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = ["973714476881"]
}

output "ip_address" {
  value = "public_ip : " + aws_instance.ec2.public_ip
}