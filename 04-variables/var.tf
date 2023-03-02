variable "sample" {
  default = "hello from var.tf"
}

output "sample" {
  value = var.sample
}

variable "default1" {}
output "default1" {
  value = var.default1
}