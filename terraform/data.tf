data "aws_vpc" "default" {
  default = true
}


data "aws_route53_zone" "this" {
  name = var.domain_name
}

