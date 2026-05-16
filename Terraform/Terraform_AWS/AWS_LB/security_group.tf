# security group for levelupvpc
resource "aws_security_group" "allow-levelup-ssh" {
  name        = "allow-levelup-ssh"
  description = "Security group that ssh traffic from anywhere"
  vpc_id      = aws_vpc.levelupvpc.id

  egress {
    from_port   = 0
    to_port     = 0 # all ports
    protocol    = "-1"  # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Allow-level-ssh"
  }
}


# security group for levelupvpc
resource "aws_security_group" "allow-mariadb" {
  name        = "allow-mariadb"
  description = "Security group that allows MariaDB traffic"
  vpc_id      = aws_vpc.levelupvpc.id

  egress {
    from_port   = 0
    to_port     = 0 # all ports
    protocol    = "-1"  # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.allow-levelup-ssh.id]
  }
  tags = {
    Name = "Allow-mariadb"
  }
}

# security group for load balancer
resource "aws_security_group" "levelupelbsg" {
  name        = "levelupelbsg"
  description = "Security group for load balancer"
  vpc_id      = aws_vpc.levelupvpc.id
  egress {
    from_port   = 0
    to_port     = 0 # all ports
    protocol    = "-1"  # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "levelup_instance_elbsg" {
  name        = "levelup_instance_elbsg"
  description = "Security group that ssh traffic from anywhere"
  vpc_id      = aws_vpc.levelupvpc.id

  egress {
    from_port   = 0
    to_port     = 0 # all ports
    protocol    = "-1"  # all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [aws_security_group.levelupelbsg.id]
  }
  tags = {
    Name = "Allow-level-elb-instance"
  }
}