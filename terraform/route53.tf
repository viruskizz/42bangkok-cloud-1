resource "aws_route53_record" "this" {
  count = var.number

  zone_id = data.aws_route53_zone.this.id
  name    = "${var.service}-${count.index}.${var.domain_name}"
  type    = "A"
  ttl     = 60
  records = [
    aws_instance.this[count.index].public_ip
  ]
}
