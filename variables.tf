#best practice: stick to underscores in variable names to avoid needing quotes
variable "region" {
   description = "Region for VPC-project"
   type = string
   default = "us-east-1"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type = string
    default = "10.0.0.0/16"
}

variable "availability_zones" {
    description = "Availability zones to provision network infra"
    type = list(string)
    default = [ "us-east-1a", "us-east-1b" ]
}

variable "priv_subnet" {
    description = "Private subnets for high availability"
    type = list(string)
    default = [ "priv-subnet-1", "priv-subnet-2" ]
}

variable "pub_subnet" {
    description = "Public subnets for high availability"
    type = list(string)
    default = [ "pub-subnet-1", "pub-subnet-2" ]
}

variable "priv_subnet_cidr" {
    description = "Private subnets CIDR block"
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "pub_subnet_cidr" {
    description = "Public subnets CIDR block"
    type = list(string)
    default = [ "10.0.3.0/24", "10.0.4.0/24" ]
}

variable "bastion_sg" {
    description = "Bastion host security group"
    type = string
    default = "bastion-sg" 
}

variable "ami" {
    description = "AMI for the bastion & private host"
    type = string
    default = "ami-0c55b159cbfafe1f0" # Example AMI, replace with your own
}