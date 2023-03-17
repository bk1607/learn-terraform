module "ec2" {
  source = "./ec2"
  for_each = var.instances
  component = each.value["name"]
  instance_type = each.value["type"]
}

variable "instances" {
  default = {
    "frontend" = {
      name = "frontend"
      type = "t2.micro"
    }
    "cart" = {
      name = "cart"
      type = "t2.micro"
    }
  }
}