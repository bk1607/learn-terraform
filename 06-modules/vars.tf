variable "instances" {
  default = {
    "frontend" = {
      component = "frontend"
      instance_type = "t3.micro"
    }
    "cart" = {
      name = "cart"
      type = "t2.micro"
    }
  }
}