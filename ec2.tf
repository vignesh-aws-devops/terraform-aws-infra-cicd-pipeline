resource "aws_instance" "pub_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.pubsub.id
  vpc_security_group_ids      = [aws_security_group.pubsg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "Public EC2 Instance 1"
  }
}


resource "aws_instance" "private_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.private_subnet.id
  vpc_security_group_ids      = [aws_security_group.private_sg.id]
  associate_public_ip_address = false

  tags = {
    Name = "Private EC2"
  }
}

