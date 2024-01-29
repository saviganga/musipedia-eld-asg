
# provision ec2 instance
resource "aws_instance" "musipedia-instance" {
  ami             = var.AMIS[var.REGION]
  instance_type   = "t2.micro"
  key_name        = aws_key_pair.musipedia-backend-key.key_name
  security_groups = [aws_security_group.app_sg.name]

  tags = {
    Name = "musipedia instance"
    User = "saviganga"
  }


}


# print out some output
output "public_ip" {
  value = aws_instance.musipedia-instance.public_ip
}

output "public_dns" {
  value = aws_instance.musipedia-instance.public_dns
}
