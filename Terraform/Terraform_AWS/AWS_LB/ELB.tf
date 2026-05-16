# aws elb Configuration 
resource "aws_elb" "levelupelb" {
  name               = "levelupelb"
  #availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  security_groups    = [aws_security_group.levelupelbsg.id]
  subnets            = [aws_subnet.levelupvpc-public-1.id, aws_subnet.levelupvpc-public-2.id, aws_subnet.levelupvpc-public-3.id]

  listener {
    instance_port     = 80
    instance_protocol = "HTTP"
    lb_port           = 80
    lb_protocol       = "HTTP"
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing = true
  connection_draining = true
  connection_draining_timeout = 400

  tags = { 
    Name = "levelupelb"
  }
  
}

