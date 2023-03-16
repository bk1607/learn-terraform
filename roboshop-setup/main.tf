resource "aws_instance" "ec2" {
  ami = "ami-0089b8e98cd95257d"
  instance_type = "t3.micro"
  vpc_security_group_ids = ["sg-068a20157a2378db8"]
  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z00815241ZW6NBO5CNYD8"
  name    = "frontend.devops2023.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.ec2.private_ip]
}

