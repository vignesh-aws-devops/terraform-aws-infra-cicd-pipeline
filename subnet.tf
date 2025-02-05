resource "aws_subnet" "pubsub" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "Public Subnet"
  }
}