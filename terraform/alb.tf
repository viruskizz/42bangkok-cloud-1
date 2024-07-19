data "aws_acm_certificate" "issued" {
  domain   = "*.42.goodgeek.club"
  statuses = ["ISSUED"]
}

resource "aws_lb" "this" {
  name               = "${var.project}-${var.service}-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [
    aws_security_group.alb_sg.id
  ]
  subnets            = var.subnet_ids

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "this" {
  for_each = toset(var.app_names)

  name     = "${var.project}-${var.service}-${each.key}-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    matcher = "200-399"
  }
}

resource "aws_lb_target_group_attachment" "this" {
  for_each = toset(var.app_names)

  target_group_arn = aws_lb_target_group.this[each.key].arn
  target_id        = aws_instance.this[each.key].id
  port             = 80
}

resource "aws_lb_listener" "frontend_https" {
  load_balancer_arn = aws_lb.this.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = data.aws_acm_certificate.issued.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[var.app_names[0]].arn
  }
}

resource "aws_lb_listener_rule" "apps" {
  for_each = toset(var.app_names)

  listener_arn = aws_lb_listener.frontend_https.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this[each.key].arn
  }

  condition {
    host_header {
      values = ["${var.service}-${each.key}-${var.domain_name}"]
    }
  }
}