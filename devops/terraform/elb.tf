
# get the vpc fom aws account
data "aws_vpcs" "current_vpcs" {}

# get the subnets in the vpc
data "aws_subnets" "available_subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpcs.current_vpcs.ids[0]]
  }
}

# create an application load balancer resource
resource "aws_lb" "musipedia-lb" {
  name               = "${var.PROJECT_NAME}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.elb_sg.id]
  subnets            = data.aws_subnets.available_subnets.ids

  enable_deletion_protection = false

  tags = {
    Name = "${var.PROJECT_NAME}-lb"
  }
}

# create a target group for the load balancer
resource "aws_lb_target_group" "musipedia-tg" {
  name        = "${var.PROJECT_NAME}-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = data.aws_vpcs.current_vpcs.ids[0]
  target_type = "instance"

  health_check {
    path     = "/artists"
    protocol = "HTTP"
    port     = 3000
  }
}

# Create an ALB listener to handle load balancer redirect - check what the module 'listener_rules' does
resource "aws_lb_listener" "musipedia-listener" {
  load_balancer_arn = aws_lb.musipedia-lb.arn
  port              = 3000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.musipedia-tg.arn
  }
}

output "elb-dns" {
  value = aws_lb.musipedia-lb.dns_name
}

