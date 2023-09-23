terraform {
  backend "s3" {
    bucket = "terraform-state-bk"
    key    = "ec2/terraform.tfstate"
    region = "us-east-1"
  }
}


module "ec2" {
  source = "./ec2"
  for_each = var.instances
  instance_name = each.value["name"]
  instance_type = each.value["type"]
  sg_id = module.sg.sg_id
}

module "sg" {
  source = "./sg"
}

module "route53" {
  source = "./route53"
  for_each = module.ec2
  component = each.key
  address = each.value["pvt_ip"]
}

