# Modern Launch Template replacing the deprecated Launch Configuration
resource "aws_launch_template" "levelup_launch_template" {
  name_prefix   = "levelup-launch-template-"
  image_id      = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t3.micro"
  key_name      = aws_key_pair.levelup_key.key_name
  user_data = filebase64("html.sh")
  lifecycle {
    create_before_destroy = true
  }

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.levelup_instance_elbsg.id]
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
  min_size                  = 2
  desired_capacity          = 2
  vpc_zone_identifier       = [aws_subnet.levelupvpc-public-1.id, aws_subnet.levelupvpc-public-2.id, aws_subnet.levelupvpc-public-3.id]
  health_check_type         = "ELB"
  load_balancers = [aws_elb.levelupelb.name]
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

output "ELB" {
  value = aws_elb.levelupelb.dns_name
}