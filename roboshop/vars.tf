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