#data block to get ami_id of specified ami
data "aws_ami" "ami_id" {
  most_recent      = true
  name_regex       = "devops-practice-ansible"
  owners           = [data.aws_caller_identity.current.account_id]
}

#data block to get owner id to use in ami block
data "aws_caller_identity" "current" {}

