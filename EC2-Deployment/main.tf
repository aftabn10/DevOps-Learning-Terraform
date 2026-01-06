provider "aws" {
    region = "eu-west-2"
}

module "ec2" {
  source                 = "./modules/ec2"
  ami                    = "ami-099400d52583dd8c4"
  instance_type          = "t3.micro"
  instance_name          = "ec2-deployment"
  user_data              = file("${path.module}/userdata.yml")
  my_ip                  = var.my_ip
  key_name               = aws_key_pair.wp_key.key_name
}

# -------------------------
# Key Pair
# -------------------------

resource "aws_key_pair" "wp_key" {
  key_name   = "wp-key"
  public_key = file("${path.module}/wp-key.pub")
}