resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
  
}

resource "aws_instance" "MyFirstInstance" {
  ami = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t3.micro"
  key_name = aws_key_pair.levelup_key.key_name
  user_data = file("installapache.sh")

  provisioner "local-exec" {
    command = "echo ${aws_instance.MyFirstInstance.private_ip} >> privateip.txt"
    
  }

  tags = {
    Name = "custom_instance"
  }
  
}



# ebs volume
resource "aws_ebs_volume" "my_volume" {
  availability_zone = aws_instance.MyFirstInstance.availability_zone
  size              = 10 # Size in GB
  type = "gp2" # General Purpose SSD

  tags = {
    Name = "my_volume"
  }
}

# attach ebs volume to instance
resource "aws_volume_attachment" "ebs_attachment" {
  device_name = "/dev/sdf" # Device name for the attached volume
  volume_id   = aws_ebs_volume.my_volume.id
  instance_id = aws_instance.MyFirstInstance.id
}

output "public_ip" {
    value = aws_instance.MyFirstInstance.public_ip
  }