variable "instances" {
  default = {
    "frontend" = {
      component = "frontend"
      instance_type = "t3.micro"
    }
    "cart" = {
      component = "cart"
      instance_type = "t2.micro"
    }
  }
}