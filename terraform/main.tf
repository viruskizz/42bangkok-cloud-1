resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name = "my-keypair"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_security_group" "this" {
  vpc_id = data.aws_vpc.default.id
  name = "${var.service}-sg"

  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    from_port = 443
    to_port   = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "this" {
  count         = var.number

  # ami           = "ami-0c185732ad1b6169b" # Debian
  ami           = "ami-060e277c0d4cce553" # Ubuntu
  instance_type = "t2.micro"
  key_name      = aws_key_pair.this.key_name
  security_groups = [ aws_security_group.this.name ]

  user_data = "${file("cloud-init.sh")}"
  tags = {
    Name    = "${var.service}-${count.index}"
    Service = "cloud1"
  }

  depends_on = [ aws_key_pair.this ]
}

resource "aws_route53_record" "this" {
  # for_each = toset(aws_instance.this)
  count = var.number

  zone_id = data.aws_route53_zone.this.id
  name    = "${var.service}-${count.index}.${var.domain_name}"
  type    = "A"
  ttl     = 60
  records = [
    aws_instance.this[count.index].public_ip
  ]
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "ec2_role" {
  name               = "${var.project}-${var.service}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect    = "Allow"
    actions   = ["ec2:Describe*"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "policy" {
  name        = "test-policy"
  description = "A test policy"
  policy      = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}