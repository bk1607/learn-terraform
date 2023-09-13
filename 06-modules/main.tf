module "ec2" {
  source = "./ec2"
  for_each = var.instances
  component = each.value["component"]
  instance_type = each.value["instance_type"]
}
variable "instances" {
  default = {
    "frontend" = {
      component = "frontend"
      instance_type = "t3.micro"
    }
  }
}