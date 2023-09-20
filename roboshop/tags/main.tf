#this is used to create tags for spot requests
resource "aws_ec2_tag" "tags" {

  key         = "Name"
  resource_id = var.id
  value       = var.instance_name
}

variable "id" {}
variable "instance_name" {}