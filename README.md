# Projects

## Overview
This repository contains a collection of Terraform-based learning projects designed to build practical DevOps skills through hands-on AWS deployments. 
Each project focuses on a different aspect of infrastructure-as-code, cloud architecture, debugging, and modular design.

The goal of this repo is to document my progress as I learn Terraform, apply real-world patterns and strengthen my understanding of how cloud infrastructure behaves under the hood.

Each project includes:

- A dedicated folder
- A full Terraform configuration
- A detailed README
- Notes on debugging, decisions, and lessons learned

---

## Projects

**1. WordPress Deployment**

A full WordPress deployment using Terraform modules, including:

- Custom VPC
- Public and private subnets
- Internet Gateway + NAT Gateway
- EC2 instance
- Security groups
- User Data Script for WordPress setup

This project focuses on multi-tier architecture, modular Terraform design and real-world cloud patterns.

**Folder**: [Wordpress Deployment](./Wordpress-Deployment/)

**2. EC2 + NGINX Deployment**

A simpler assignment designed to reinforce Terraform fundamentals and real-world debugging. 

This project focuses on EC2 provisioning, default VPC behaviour and cloud-init troubleshooting.

Key components:

- EC2 instance in the default VPC
- Nginx installed via cloud-init
- SSH access restricted to my IP
- Security group configuration
- Key pair creation
- Service debugging using systemctl

**Folder**: [EC2 Deployment](./EC2-Deployment/)  
