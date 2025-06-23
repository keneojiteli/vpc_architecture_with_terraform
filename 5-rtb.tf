#provides a resource to create a VPC routing table

#public route table
resource "aws_route_table" "pub_rtb" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

    tags = {
      Name = "Public route table"
    }
}

#private route table
#create seperate route table for priv-subnet because there are multiple NAT gateways
resource "aws_route_table" "priv_rtb" {
    vpc_id = aws_vpc.main.id
    count = length(var.priv_subnet)
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = element(aws_nat_gateway.public_nat_gateway[*].id, count.index)
    }

    #test the setup with one private route table
    # count = 1
    # route {
    #     cidr_block = "0.0.0.0/0"
    #     nat_gateway_id = element(aws_nat_gateway.public_nat_gateway[*].id, count.index)
    # }

    tags = {
      Name = "Private route table"
    }
}   

#public route table association
#Provides a resource to create an association between a route table and a subnet or a route table and an internet gateway
resource "aws_route_table_association" "public_rtb_association" {
    count = length(var.pub_subnet_cidr)

    #test the setup with one public route table association
    # count = 1

    route_table_id = aws_route_table.pub_rtb.id
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index)
    depends_on = [ aws_subnet.public_subnet, aws_route_table.pub_rtb ]
}

#private route table association
resource "aws_route_table_association" "private_rtb_association" {
    count = length(var.priv_subnet_cidr)

    #test the setup with one public route table association
    # count = 1

    route_table_id = element(aws_route_table.priv_rtb[*].id, count.index)
    subnet_id = element(aws_subnet.private_subnet[*].id, count.index)
    depends_on = [ aws_subnet.private_subnet, aws_route_table.priv_rtb ]
}