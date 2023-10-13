resource "aws_spot_instance_request" "ec2" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  iam_instance_profile = "${var.component}-${var.env}-role"
  spot_type = "persistent"
  instance_interruption_behavior = "stop"
  wait_for_fulfillment = true
  tags = {
    Name = var.component
    Monitor = var.Monitor
  }

}
resource "aws_ec2_tag" "tag1" {
  resource_id = aws_spot_instance_request.ec2.id
  key         = "Name"
  value       = var.component
}
# to create iam policy
resource "aws_iam_policy" "example" {
  name = "${var.component}-${var.env}-policy"
  policy = jsonencode({

    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ssm:Describe*",
                "ssm:Get*",
                "ssm:List*"
            ],
            "Resource": "*"
        }
    ]
})

}

# to create a role

resource "aws_iam_role" "test_role" {
  name = "${var.component}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

# to attach the example policy to a role
resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.test_role.name
  policy_arn = aws_iam_policy.example.arn
}

#we need to create an instance profile for our role to attach
resource "aws_iam_instance_profile" "test_profile" {
  name = "${var.component}-${var.env}-role"
  role = aws_iam_role.test_role.name
}

# this  is used for creating route 53 records
resource "aws_route53_record" "www" {
  zone_id = "Z00815241ZW6NBO5CNYD8"
  name    = "${var.component}-${var.env}.devops2023.online"
  type    = "A"
  ttl     = "300"
  records = [aws_spot_instance_request.ec2.private_ip]
  depends_on = [aws_spot_instance_request.ec2]
}

#this is used for creating sg
resource "aws_security_group" "allow_tls" {
  name        = "${var.component}-${var.env}-sg"
  description = "Allow TLS inbound traffic"


  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.component}-${var.env}-sg"
  }
}

#resource "null_resource" "commands" {
#  depends_on = [aws_route53_record.www]
#  provisioner "remote-exec" {
#    connection {
#      host = aws_instance.ec2.public_ip
#      user = "centos"
#      password = "DevOps321"
#    }
#    inline = [
#     "ansible-pull -i localhost, -U https://github.com/bk1607/ansible-roboshop roboshop.yml -e role_name=${var.component} -e env=${var.env}"
#    ]
#
#  }
#}

#create ec2 instance
#resource "aws_instance" "ec2" {
#  ami = data.aws_ami.ami_id.id
#  instance_type = var.instance_type
#  vpc_security_group_ids = [aws_security_group.allow_tls.id]
#  iam_instance_profile = "${var.component}-${var.env}-role"
#  tags = {
#    Name = "${var.component}-${var.env}"
#    Monitor = var.Monitor
#  }
#}
#to get private_ip address of instances
#output "pvt_ip" {
#  value = aws_instance.ec2.private_ip
#  depends_on = [aws_instance.ec2]
#}