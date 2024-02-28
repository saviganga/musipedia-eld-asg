

data "aws_ami" "musipedia" {
  most_recent      = true
  owners           = ["self"]

  filter {
    name   = "tag:Name"
    values = ["${var.PROJECT_NAME}-*"]
  }
}

data "aws_ami" "deregister-list" {
  most_recent      = false
  owners           = ["self"]

  filter {
    name   = "tag:Name"
    values = ["${var.PROJECT_NAME}-*"]
  }
}


resource "aws_ami" "deregister" {
  count = length(data.aws_ami.deregister-list.ids)

  # Specify the ID of the AMI to deregister
  image_id = data.aws_ami.deregister-list.ids[count.index]

  # Set delete_on_termination to true to deregister the AMI
  delete_on_termination = true
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



output "deregister_ami_list_output" {
  value = data.aws_ami.deregister-list
}


output "deregister_ami_output" {
  value = data.aws_ami.deregister
}

