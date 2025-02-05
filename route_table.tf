
# Internet Gateway
resource "aws_internet_gateway" "tigw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

# Public Route Table
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tigw.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

# Associate Public Subnet with Public Route Table
resource "aws_route_table_association" "pubsub-associate" {
  subnet_id      = aws_subnet.pubsub.id
  route_table_id = aws_route_table.public-rt.id
}

# Elastic IP for NAT
resource "aws_eip" "teip" {
  domain = "vpc"
}

# NAT Gateway for Private Subnet
resource "aws_nat_gateway" "tnat" {
  allocation_id = aws_eip.teip.id
  subnet_id     = aws_subnet.pubsub.id

  tags = {
    Name = "NAT Gateway"
  }
}

# Private Route Table
resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.tnat.id
  }

  tags = {
    Name = "Private Route Table"
  }
}

# Associate Private Subnet with Private Route Table
resource "aws_route_table_association" "prisub-associate" {
  subnet_id      = aws_subnet.privatesub.id
  route_table_id = aws_route_table.private-rt.id
}