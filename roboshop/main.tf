module "ec2" {
  source = "./ec2"
  for_each = var.instances
  instance_name = each.key["name"]
  instance_type = each.key["type"]
}

