output "public-ip-address" {
    value = aws_instance.this.public_ip
}