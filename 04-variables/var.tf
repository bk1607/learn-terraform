variable "sample" {
  default = "hello from var.tf"
}

output "sample" {
  value = var.sample
}

variable "default"{
}
output "default" {
  value = var.default
}