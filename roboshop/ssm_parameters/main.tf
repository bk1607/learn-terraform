terraform {
  backend "s3" {}
}

resource "aws_ssm_parameter" "foo" {
  count = length(var.parameters)
  name  = var.parameters["name"]
  type  = var.parameters["type"]
  value = var.parameters["value"]
}

variable "parameters" {}