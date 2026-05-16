
resource "aws_instance" "MyFirstInstnace" {
  count         = 3
  ami           = "ami-0fe18bc3cfa53a248"
  instance_type = "t3.micro"

  tags = {
    Name = "demoinstnce-${count.index}"
  }
}