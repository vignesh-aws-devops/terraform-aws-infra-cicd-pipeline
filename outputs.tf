output "public_instance_ip" {
  value = aws_instance.pub_instance.public_ip
}

output "private_instance_id" {
  value = aws_instance.pri_instance.id
}
