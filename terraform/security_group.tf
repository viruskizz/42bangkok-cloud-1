
resource "aws_security_group" "ec2_sg" {
  vpc_id = data.aws_vpc.default.id
  name = "${var.project}-${var.service}-ec2-sg"

  ingress {
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    security_groups = [ aws_security_group.alb_sg.id ]
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

  tags = {
    Name = "${var.project}-${var.service}-ec2-sg"
  }
}


resource "aws_security_group" "alb_sg" {
  vpc_id = data.aws_vpc.default.id
  name = "${var.project}-${var.service}-alb-sg"

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

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.service}-ec2-sg"
  }
}
