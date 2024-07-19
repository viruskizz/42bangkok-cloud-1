resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name = "${var.project}-${var.service}-keypair"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_instance" "this" {
  for_each = toset(var.app_names)

  ami           = "ami-060e277c0d4cce553" # Ubuntu
  instance_type = "t3.medium"
  key_name      = aws_key_pair.this.key_name
  security_groups = [ aws_security_group.ec2_sg.name ]
  iam_instance_profile = aws_iam_instance_profile.ec2_profile.name

  user_data = templatefile("cloud-init.sh.tpl", {
    app_dir = "/home/ubuntu/app/"
    db_password = var.db_password
    wp_site = "${var.service}-${each.key}.${var.domain_name}"
  })
  user_data_replace_on_change = true
  tags = {
    Name    = "${var.service}-${each.key}"
    Service = "cloud1"
  }

  depends_on = [ aws_key_pair.this ]
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.project}-${var.service}-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role" "ec2_role" {
  name               = "${var.project}-${var.service}-ec2-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
  inline_policy {
    name = "CodeDeployEc2"
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Action   = [
            "s3:Get*",
            "s3:List*"
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
    })
  }
}
