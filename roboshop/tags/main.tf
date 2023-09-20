#this is used to create tags for spot requests
resource "aws_ec2_tag" "tags" {

  key         = "Name"
  resource_id = aws_spot_instance_request.ec2.spot_instance_id
  value       = var.instance_name
}