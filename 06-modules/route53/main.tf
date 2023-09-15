resource "aws_route53_record" "www" {
  zone_id = "Z00815241ZW6NBO5CNYD8"
  name    = "${component}.devops2023.online"
  type    = "A"
  ttl     = 300
  records = []
}
