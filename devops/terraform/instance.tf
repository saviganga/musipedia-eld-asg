
# # provision ec2 instance
# resource "aws_instance" "musipedia-instance" {
#   ami             = var.AMIS[var.REGION]
#   instance_type   = "t2.micro"
#   key_name        = aws_key_pair.musipedia-backend-key.key_name
#   security_groups = [aws_security_group.app_sg.name]

#   tags = {
#     Name = "musipedia instance"
#     User = "saviganga"
#   }


# }

resource "aws_launch_template" "ec2-tpl" {
  name = "ec2-tpl"

  # block_device_mappings {
  #   device_name = "/dev/sdf"

  #   ebs {
  #     volume_size = 20
  #   }
  # }

  # capacity_reservation_specification {
  #   capacity_reservation_preference = "open"
  # }

  # cpu_options {
  #   core_count       = 4
  #   threads_per_core = 2
  # }

  # credit_specification {
  #   cpu_credits = "standard"
  # }

  # disable_api_stop        = true
  # disable_api_termination = true

  # ebs_optimized = true

  # elastic_gpu_specifications {
  #   type = "test"
  # }

  # elastic_inference_accelerator {
  #   type = "eia1.medium"
  # }

  # iam_instance_profile {
  #   name = "test"
  # }

  image_id = var.AMIS[var.REGION]

  # instance_initiated_shutdown_behavior = "terminate"

  # instance_market_options {
  #   market_type = "spot"
  # }

  instance_type = "t2.nano"

  # kernel_id = "test"

  key_name = aws_key_pair.musipedia-backend-key.key_name

  # license_specification {
  #   license_configuration_arn = "arn:aws:license-manager:eu-west-1:123456789012:license-configuration:lic-0123456789abcdef0123456789abcdef"
  # }

  # metadata_options {
  #   http_endpoint               = "enabled"
  #   http_tokens                 = "required"
  #   http_put_response_hop_limit = 1
  #   instance_metadata_tags      = "enabled"
  # }

  # monitoring {
  #   enabled = true
  # }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.app_sg.id]
  }

  # placement {
  #   availability_zone = "us-west-2a"
  # }

  # ram_disk_id = "test"

  # vpc_security_group_ids = [aws_security_group.app_sg.id]

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "musi"
    }
  }

  # user_data = filebase64("${path.module}/example.sh")
}

