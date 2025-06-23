#provides an Elastic IP resource
resource "aws_eip" "nat_eip" {
    count = length(var.pub_subnet)

    #test the setup with one elastic IP
    # count = 1

    domain = "vpc"
    depends_on = [ aws_internet_gateway.igw ]

    tags = {
      Name = "Elastic IP- ${var.pub_subnet[count.index]}"
    }
}

#provides a resource to create a VPC NAT Gateway
resource "aws_nat_gateway" "public_nat_gateway" {
    count = length(var.pub_subnet)
    subnet_id = element(aws_subnet.public_subnet[*].id, count.index) #gets all the subnet id's
    allocation_id = element(aws_eip.nat_eip[*].id, count.index) 

    #test the setup with one NAT gateway
    # count = 1
    # subnet_id = aws_subnet.public_subnet[0].id 
    # allocation_id = aws_eip.nat_eip[0].id

    depends_on = [ aws_internet_gateway.igw ]

    tags = {
      # Name: element(var.pub_subnet, count.index)
      # Name= "NAT gateway-${var.pub_subnet}"
      Name = "NAT gateway- ${var.pub_subnet[count.index]}"
      # Name = "NAT gateway-${var["pub-subnet"]}"
    }
}