

data "aws_ami" "musipedia" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "tag:Name"
    values = ["${var.PROJECT_NAME}-*"]
  }
}

resource "aws_launch_template" "ec2-tpl" {
  name = "ec2-tpl"

  image_id = data.aws_ami.musipedia.image_id

  instance_type = var.INSTANCE_TYPE

  key_name = aws_key_pair.musipedia-backend-key.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.app_sg.id]
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.PROJECT_NAME
    }
  }

  user_data = filebase64("${path.module}/startapp.sh")
}


output "ami_output" {
  value = data.aws_ami.musipedia.name
}

