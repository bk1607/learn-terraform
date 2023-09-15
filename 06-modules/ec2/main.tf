resource "aws_instance" "ec2" {
  ami = "ami-03265a0778a880afb"
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = var.component
  }
}

resource "aws_route53_record" "www" {
  zone_id = "Z00815241ZW6NBO5CNYD8"
  name    = "frontend.devops2023.online"
  type    = "A"
  ttl     = 300
  records = [aws_instance.ec2.public_ip]
}


variable "instance_type" {}
variable "component" {}
variable "sg_id" {}

