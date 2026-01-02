# VPC
resource "aws_vpc" "wp_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "wp-vpc"
  }
}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.wp_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-west-2a"

  tags = {
    Name = "public-subnet-main"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.wp_vpc.id

  tags = {
    Name = "igw-main"
  }
}

# Route Table
resource "aws_route_table" "main_rt_public" {
  vpc_id = aws_vpc.wp_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "main_rt_public"
  }
}

# Route Table Association
resource "aws_route_table_association" "subnet_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.main_rt_public.id
}

# -------------------------
# Security Group (modern style)
# -------------------------

# Base SG
resource "aws_security_group" "aws_sg" {
  name        = "aws_sg"
  description = "Security group for WordPress EC2"
  vpc_id      = aws_vpc.wp_vpc.id

  tags = {
    Name = "aws_sg"
  }
}

# Allow HTTP (port 80)
resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

# Allow SSH from your IP (stored in .tfvars)
resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = var.my_ip
  ip_protocol       = "tcp"
  from_port         = 22
  to_port           = 22
}

# Allow all outbound traffic
resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.aws_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}l;l;l