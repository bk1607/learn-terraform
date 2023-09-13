module "ec2" {
  source = "./ec2"
  component = var.instances.component
  instance_type = var.instances.instance_type
}
variable "instances" {
  component = "frontend"
  instance_type = "t3.micro"
}