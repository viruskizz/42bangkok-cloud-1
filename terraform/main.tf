terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0"
    }
  }

  required_version = ">= 1.2.0"
}


provider "aws" {
  region = var.region
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name = "my-keypair"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_default_security_group" "default" {
  vpc_id = data.aws_vpc.default.id

  ingress {
    protocol  = -1
    self      = true
    from_port = 0
    to_port   = 0
  }

  ingress {
    protocol  = "tcp"
    self      = true
    from_port = 80
    to_port   = 80
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

  ami           = "ami-0c185732ad1b6169b"
  instance_type = "t2.micro"
  key_name      = "my-keypair"
  security_groups = [ aws_default_security_group.default.name ]
  tags = {
    Name = "${var.name}-${count.index}"
  }

  depends_on = [ aws_key_pair.this ]
}