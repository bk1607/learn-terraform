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
  iam_instance_profile = aws_iam_role.test_role.name
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
resource "aws_iam_policy" "example" {
  name = "example"
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
  name = "test_role"

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
  name = "test_profile"
  role = aws_iam_role.test_role.name
}
