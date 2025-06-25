# AWS VPC Architecture With Terraform
This repository contains Terraform configurations to provision a highly available, scalable, and secure Virtual Private Cloud (VPC) infrastructure on Amazon Web Services (AWS). It includes public and private subnets across multiple Availability Zones with proper routing for internet access.

## Project Overview
This project aims to demonstrate the deployment of a foundational AWS network environment capable of hosting a scalable web application. It showcases best practices in Infrastructure as Code (IaC), and cloud networking.

## Architecture Diagram
![Architecture Diagram](img/arch_diagram.png)

## Features
- Multi-AZ Deployment: Infrastructure spans two Availability Zones for high availability.
- Segregated Networking: Public and private subnets for secure resource placement.
- Internet Connectivity: Internet Gateway for public subnet access and NAT Gateways for secure outbound access from private subnets.
- Security Best Practices: Granular Security Groups for EC2 instances (Bastion host and private host). 
- Bastion Host for secure SSH access.

## Technologies and Resources Used
- Virtual Private Cloud (VPC) – logically isolated AWS network

- Subnet – segment within a VPC

- Public Subnet – has Internet Gateway access

- Private Subnet – needs NAT Gateway for outbound internet

- Internet Gateway (IGW) – connects VPC to the internet

- Elastic IP – static IPv4 for NAT

- NAT Gateway – enables private subnet internet access

- Route Table / Association – controls subnet routing

- EC2 Instances – bastion (public) and private test VM

- Security Group – virtual firewall for EC2

## Terraform Setup
- provider.tf – AWS provider config

- variables.tf – input variables (region, AZs, CIDR blocks)

- vpc.tf – defines the VPC

- subnets.tf – creates public and private subnets per AZ using count and element

- igw.tf – attaches Internet Gateway

- nat.tf – launches a NAT gateway per AZ with Elastic IP

- rtb.tf – creates route tables for public and private networks

- route_table_association.tf – links route tables to subnets

- ec2.tf – deploys bastion and private EC2 instances

- sg.tf – security groups allowing restricted SSH access

##### [Project Documentation](https://keneojiteli.hashnode.dev/cloud-networking-in-practice-building-a-highly-available-vpc-on-aws-with-terraform) 