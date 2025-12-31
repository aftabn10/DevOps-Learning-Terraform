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

variable "subnet_id" {
    description = "subnet name for the EC2 instance"   
}

variable "vpc_security_group_ids" {
    description = "security group ids for the EC2 instance"
    type = list(string)
}
variable "user_data" {
    description = "user data script for the EC2 instance"
}

variable "key_name" {
  type = string
}
