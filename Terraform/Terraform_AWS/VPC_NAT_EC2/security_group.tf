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