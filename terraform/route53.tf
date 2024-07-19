resource "aws_route53_record" "this" {
  for_each = toset(var.app_names)

  zone_id = data.aws_route53_zone.this.id
  name    = "${var.service}-${each.key}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }

  depends_on = [
    aws_lb.this
  ]
}
