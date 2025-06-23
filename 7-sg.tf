#security group for the bastion host 
resource "aws_security_group" "bastion_sg" {
    name = var.bastion_sg
    description = "Security group for bastion host"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        # cidr_blocks = ["<YOUR_PUBLIC_IP_FROM_IFCONFIG.ME>/32"] #defines who is allowed to initiate the connection (the source)
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.bastion_sg
    }
}

#security group for the private host 
resource "aws_security_group" "private_sg" {
    name = "private-sg"
    description = "Security group for private subnets"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port =22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.bastion_sg.id]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "private-sg"
    }
}