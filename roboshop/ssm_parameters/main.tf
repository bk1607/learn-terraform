terraform {
  backend "s3" {}
}

resource "aws_ssm_parameter" "foo" {
  name  = var.parameters["name"]
  type  = var.parameters["type"]
  value = var.parameters["value"]
}

variable "parameters" {}