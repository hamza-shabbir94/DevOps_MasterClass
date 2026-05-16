
data "aws_availability_zones" "available" {
  
}

data "aws_ami" "ubuntu-ami" {
  most_recent = true  # its mean it will going fetch most recent ami from AWS
  owners = ["099720109477"]

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-20260424"]
  }
}

resource "aws_instance" "MyFirstInstance" {
  ami = data.aws_ami.ubuntu-ami.id
  instance_type = "t3.micro"
  availability_zone = data.aws_availability_zones.available.names[1]

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