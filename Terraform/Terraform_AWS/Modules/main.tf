module "ec2_cluster" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "6.4.0"
  name = "ec2-cluster"
  count = 2
  ami = "ami-05cf1e9f73fbad2e2"
  instance_type = "t3.micro"
  subnet_id = "subnet-0acdace14bfa1a80c"

  tags = {
    Environment = "dev"
    terraform = "true"
  }
}