provider "aws" {
  region = "eu-west-2"
}

# -------------------------
# VPC
# -------------------------

module "vpc" {
  source = "./modules/vpc"
  my_ip = var.my_ip
}

# -------------------------
# EC2 Module
# -------------------------
module "ec2" {
  source                 = "./modules/ec2"
  ami                    = "ami-099400d52583dd8c4"
  instance_type          = "t3.micro"
  instance_name          = "wordpress_tf"
  subnet_id              = module.vpc.public_subnet_id
  vpc_security_group_ids = [module.vpc.sg_id]
  user_data              = file("${path.module}/user_data.sh")
  key_name               = aws_key_pair.wp_key.key_name
}

# -------------------------
# Key Pair
# -------------------------

resource "aws_key_pair" "wp_key" {
  key_name   = "wp-key"
  public_key = file("${path.module}/wp-key.pub")
}



