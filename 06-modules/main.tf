module "ec2" {
  source = "./ec2"
  for_each = var.instances
  component = each.value["component"]
  instance_type = each.value["instance_type"]
  sg_id = module.sg.sg_id
}

output "ips" {
  value = module.ec2.private_ip
}

module "sg" {
  source = "./sg"
}

