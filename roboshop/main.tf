module "ec2" {
  source = "./ec2"
  for_each = var.instances
  instance_type = each.value["type"]
  component = each.value["name"]
  env = var.env
  Monitor = try(each.value["Monitor"],"No")
}

#module "iam_user" {
#  source = "./iam_user"
#  for_each = var.instances
#  component = each.value["name"]
#  env = each.value["environment"]
#}

#module "sg" {
#  source = "./sg"
#}

#module "route53" {
#  source = "./route53"
#  for_each = module.ec2
#  component = each.key
#  address = each.value["pvt_ip"]
#}

