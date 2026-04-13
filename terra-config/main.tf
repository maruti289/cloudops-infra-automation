# Key Pair
resource "aws_key_pair" "tester" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

# Security Group
resource "aws_security_group" "allow_web_ssh" {
  name        = "allow-web-ssh"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# 6 EC2 Instances — 2 per environment
resource "aws_instance" "web" {
  for_each = {
    dev-1   = "dev"
    dev-2   = "dev"
    stage-1 = "stage"
    stage-2 = "stage"
    prod-1  = "prod"
    prod-2  = "prod"
  }

  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.tester.key_name
  vpc_security_group_ids      = [aws_security_group.allow_web_ssh.id]
  associate_public_ip_address = true

  tags = {
    Name = each.key
    Env  = each.value
  }
}