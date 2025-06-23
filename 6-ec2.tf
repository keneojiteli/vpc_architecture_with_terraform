#ec2 instance for the bastion server, located in the public subnet
resource "aws_instance" "bastion" {
    ami = var.ami
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet[0].id
    # security_groups = [aws_security_group.bastion_sg.name] #deprecated
    vpc_security_group_ids = [aws_security_group.bastion_sg.id]
    key_name = "project-key"

    tags = {
        Name = "bastion-host"
    }
}

#ec2 instance for the private server, located in the private subnet
resource "aws_instance" "private" {
    ami = var.ami
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_subnet[0].id
    vpc_security_group_ids = [aws_security_group.private_sg.id] 
    key_name = "project-key"

    tags = {
        Name = "private-host"
    }
}

