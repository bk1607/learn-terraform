resource "aws_ssm_parameter" "normal_parameters" {
  count = length(var.parameters)
  name  = var.parameters[count.index].name
  type  = var.parameters[count.index].type
  value = var.parameters[count.index].value
}
resource "aws_ssm_parameter" "secret_parameters" {
  count = length(var.secrets)
  name  = var.secrets[count.index].name
  type  = var.secrets[count.index].type
  value = var.secrets[count.index].value
}

