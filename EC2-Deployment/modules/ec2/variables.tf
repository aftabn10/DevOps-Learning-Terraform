variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
    description = "instance type for the EC2 instance"
    type = string
}

variable "instance_name" {
    description = "instance name for the EC2 instance"
    type = string
}

variable "user_data" {
    description = "user data yaml script for the EC2 instance"
}

variable "key_name" {
  type = string
}

variable "my_ip" {
  description = "Your public IP address with /32"
  type        = string
}