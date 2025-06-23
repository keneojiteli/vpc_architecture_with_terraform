# public subnet
# count.index is dependent on the number of count, what happens if the length of variable used in count is different from len of variables used for count.index???

#syntax for element = element(list, index)
resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.main.id
  count = length(var.pub_subnet_cidr)
  availability_zone = element(var.availability_zones, count.index)
  cidr_block = element(var.pub_subnet_cidr, count.index)

  #test the setup with resources in one public subnet
  # count = 1
  # availability_zone = var.availability_zones[0]
  # cidr_block = var.pub_subnet_cidr[0]

  map_public_ip_on_launch = true

  tags = {
    Name = element(var.pub_subnet, count.index)
  }
}

# private subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.main.id
  count = length(var.priv_subnet_cidr)
  availability_zone = element(var.availability_zones, count.index)
  cidr_block = element(var.priv_subnet_cidr, count.index)

  #test the setup with resources in one private subnet
  # count = 1
  # availability_zone = var.availability_zones[0]
  # cidr_block = var.priv_subnet_cidr[0]

  map_public_ip_on_launch = false

  tags = {
    Name = element(var.priv_subnet, count.index)
  }
}