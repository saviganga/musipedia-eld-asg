
# Create Auto Scaling Group
resource "aws_autoscaling_group" "musipedia-asg" {
  name             = "asg"
  desired_capacity = 2
  max_size         = 5
  min_size         = 1

  vpc_zone_identifier = data.aws_subnets.available_subnets.ids

  launch_template {
    id      = aws_launch_template.ec2-tpl.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.musipedia-tg.arn]


}


output "asg_output" {
  value = aws_autoscaling_group.musipedia-asg.name
}

