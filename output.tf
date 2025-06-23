output "vpc_id" {
  description = "The vpc ID"
  value = aws_vpc.main.id
}

output "private_subnet_ids" {
  description = "Private subnets ID"
  # value = aws_subnet.private-subnet[*].id
  value = [for priv_subnet in aws_subnet.private_subnet : priv_subnet.id]
}

output "public_subnet_ids" {
  description = "Public subnets ID"
  # value = aws_subnet.public-subnet[*].id
  value = [for pub_subnet in aws_subnet.public_subnet : pub_subnet.id]
}

output "bastion_host_ip" {
  description = "Bastion host public IP"
  value = aws_instance.bastion.public_ip
  
}