output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "sg_id" {
  value = aws_security_group.aws_sg.id
}