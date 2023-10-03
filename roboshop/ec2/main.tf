#create ec2 instance
resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.sg_id]
  iam_instance_profile = data.aws_iam_instance_profile.test.name
  tags = {
    Name = var.instance_name
  }
}


#to get private_ip address of instances
output "pvt_ip" {
  value = aws_instance.ec2.private_ip
  depends_on = [aws_instance.ec2]
}
