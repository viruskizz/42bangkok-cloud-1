resource "aws_iam_role" "codedeploy_role" {
  name               = "${var.project}-${var.service}-codedeploy-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "codedeploy.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [
    "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  ]
}


resource "aws_codedeploy_app" "this" {
  name = "${var.service}-codedeploy-app"
  compute_platform = "Server"
}

# resource "aws_sns_topic" "example" {
#   name = "example-topic"
# }

resource "aws_codedeploy_deployment_group" "this" {
  app_name              = aws_codedeploy_app.this.name
  deployment_group_name = "${var.service}-group"
  service_role_arn      = aws_iam_role.codedeploy_role.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Project"
      type  = "KEY_AND_VALUE"
      value = "${var.project}"
    }

    ec2_tag_filter {
      key   = "Service"
      type  = "KEY_AND_VALUE"
      value = "${var.service}"
    }
  }

  # trigger_configuration {
  #   trigger_events     = ["DeploymentFailure"]
  #   trigger_name       = "example-trigger"
  #   trigger_target_arn = aws_sns_topic.example.arn
  # }

  # auto_rollback_configuration {
  #   enabled = true
  #   events  = ["DEPLOYMENT_FAILURE"]
  # }

  # alarm_configuration {
  #   alarms  = ["my-alarm-name"]
  #   enabled = true
  # }

  outdated_instances_strategy = "UPDATE"

  depends_on = [ aws_instance.this ]
}