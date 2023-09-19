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
}

