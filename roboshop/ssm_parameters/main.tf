terraform {
  backend "s3" {}
}

resource "aws_ssm_parameter" "foo" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].type
  value = var.parameters[count.value].value
}

variable "parameters" {}