resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-068a20157a2378db8"]
  tags = {
    Name = "test"
  }
}