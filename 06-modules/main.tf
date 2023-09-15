module "ec2" {
  source = "./ec2"
  for_each = var.instances
  component = each.value["component"]
  instance_type = each.value["instance_type"]
  sg_id = module.sg.sg_id
}

output "ips" {
  value = module.ec2
}
module "route53" {
  source = "./route53"
  for_each = module.ec2
  component = each.key
  address = each.value["private_ip_address"]

}
module "sg" {
  source = "./sg"
}

