resource "aws_instance" "pub_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.pubsub.id
  vpc_security_group_ids      = [aws_security_group.pubsg.id]
  associate_public_ip_address = true
  key_name                    = var.key_name

  tags = {
    Name = "Public EC2 Instance"
  }
}

resource "aws_instance" "pri_instance" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.privatesub.id
  vpc_security_group_ids      = [aws_security_group.prisg.id]
  associate_public_ip_address = false
  key_name                    = var.key_name

  tags = {
    Name = "Private EC2 Instance"
  }
}