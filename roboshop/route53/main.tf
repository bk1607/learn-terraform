# this module is used for creating route 53 records
resource "aws_route53_record" "www" {
  zone_id = "Z00815241ZW6NBO5CNYD8"
  name    = "${var.component}.devops2023.online"
  type    = "A"
  ttl     = "300"
  records = [var.address]
}

variable "component" {}
variable "address" {}
