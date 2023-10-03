#create ec2 instance
resource "aws_instance" "ec2" {
  ami = data.aws_ami.ami_id.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  iam_instance_profile = "${var.component}-${var.env}-role"
  tags = {
    Name = "${var.component}-${var.env}"
  }
}


#to get private_ip address of instances
#output "pvt_ip" {
#  value = aws_instance.ec2.private_ip
#  depends_on = [aws_instance.ec2]
#}

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
  records = [aws_instance.ec2.private_ip]
  depends_on = [aws_instance.ec2]
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
    Name = "allow_tls"
  }
}

