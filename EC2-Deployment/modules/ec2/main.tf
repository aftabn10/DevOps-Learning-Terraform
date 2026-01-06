resource "aws_instance" "this" {
  ami                    = var.ami
  instance_type          = var.instance_type
  user_data              = var.user_data
  key_name               = var.key_name

  vpc_security_group_ids = [aws_security_group.web_sg.id]

  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}

# -------------------------
# Default VPC (data source)
# -------------------------
data "aws_vpc" "default" {
  default = true
}

# -------------------------
# Security Group
# -------------------------
resource "aws_security_group" "web_sg" {
  name        = "web-sg"
  description = "Allow HTTP traffic"
  vpc_id      = data.aws_vpc.default.id

  tags = {
    Name = "web-sg"
  }
}

# Allow HTTP (port 80)
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

# Allow SSH from your IP (stored in .tfvars)
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = var.my_ip
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.web_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}


