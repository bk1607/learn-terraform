# to create iam policy
resource "aws_iam_policy" "example" {
  name = "${var.component}-${env}-policy"
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
  name = "${var.component}-${env}-role"

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
  name = "${var.component}-${env}-profile"
  role = aws_iam_role.test_role.name
}