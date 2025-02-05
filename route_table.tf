
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