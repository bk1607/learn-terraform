
data "aws_ami" "ami_id" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"


}
output "id" {
  value = aws_ami.ami_id.id
}