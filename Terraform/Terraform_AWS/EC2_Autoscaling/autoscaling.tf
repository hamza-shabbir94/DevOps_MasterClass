# Modern Launch Template replacing the deprecated Launch Configuration
resource "aws_launch_template" "levelup_launch_template" {
  name_prefix   = "levelup-launch-template-"
  image_id      = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t3.micro"
  key_name      = aws_key_pair.levelup_key.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.allow-levelup-ssh.id]
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  
}

# autoscaling group
resource "aws_autoscaling_group" "levelup_asg" {
  name                      = "levelup-asg"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 1
  vpc_zone_identifier       = [aws_subnet.levelupvpc-public-1.id, aws_subnet.levelupvpc-public-2.id, aws_subnet.levelupvpc-public-3.id]
  health_check_type         = "EC2"
  health_check_grace_period = 300

  launch_template {
    id      = aws_launch_template.levelup_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "levelup-asg-instance"
    propagate_at_launch = true
  }
}

# autoscaling configuration for scaling policies
resource "aws_autoscaling_policy" "levelup-cpu-policy" {
  name                   = "levelup-cpu-policy"
  autoscaling_group_name = aws_autoscaling_group.levelup_asg.name
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
  cooldown               = "200"
}

# autoscaling cloudwatch metric alarm for CPU utilization
resource "aws_cloudwatch_metric_alarm" "levelup_cpu_alarm" {
  alarm_name          = "levelup-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"
  alarm_description   = "Alarm when CPU exceeds 30%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.levelup_asg.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.levelup-cpu-policy.arn]
}

# auto Descaling policy
resource "aws_autoscaling_policy" "levelup-cpu-descaling-policy" {
  name                   = "levelup-cpu-descaling-policy"
  autoscaling_group_name = aws_autoscaling_group.levelup_asg.name
  policy_type            = "SimpleScaling"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
  cooldown               = "200"
}

# autoscaling cloudwatch metric alarm for CPU utilization for descaling
resource "aws_cloudwatch_metric_alarm" "levelup_cpu_descaling_alarm" {
  alarm_name          = "levelup-cpu-descaling-alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "10"
  alarm_description   = "Alarm when CPU is less than 10%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.levelup_asg.name
  }
  actions_enabled = true
  alarm_actions   = [aws_autoscaling_policy.levelup-cpu-descaling-policy.arn]
}