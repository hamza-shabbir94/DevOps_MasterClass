resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  
}

resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t3.micro"
  key_name = aws_key_pair.levelup_key.key_name

  vpc_security_group_ids = [aws_security_group.allow-levelup-ssh.id]
  subnet_id = aws_subnet.levelupvpc-public-1.id

  provisioner "local-exec" {
    command = "echo ${aws_instance.MyFirstInstance.private_ip} >> privateip.txt"
    
  }

  tags = {
    Name = "custom_instance"
  }
  
}


output "public_ip" {
    value = aws_instance.MyFirstInstance.public_ip
  }