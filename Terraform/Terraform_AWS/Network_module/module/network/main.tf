# AWS VPC Resource
resource "aws_vpc" "levelupvpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

    tags = {
        Name = var.environment_tag
    }
}

# AWS Internet Gateway Resource
resource "aws_internet_gateway" "levelupvpc-igw" {
  vpc_id = aws_vpc.levelupvpc.id
    tags = {
        Name = var.environment_tag
    }
}

# AWS Subnet Resources
resource "aws_subnet" "subnet_public" {
    vpc_id = aws_vpc.levelupvpc.id
    cidr_block = var.cidr_subnet
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true
    
    tags = {
        Name = var.environment_tag
    }
}

# AWS Route Table Resource
resource "aws_route_table" "levelupvpc-rtb-public" {
    vpc_id = aws_vpc.levelupvpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.levelupvpc-igw.id
    }

    tags = {
        Name = var.environment_tag
    }
}

# AWS Route Table Association Resource
resource "aws_route_table_association" "levelupvpc-rta-subnet-public" {
    subnet_id = aws_subnet.subnet_public.id
    route_table_id = aws_route_table.levelupvpc-rtb-public.id
}

# AWS Security Group Resource
resource "aws_security_group" "levelupvpc-sg-ssh" {
    name = "levelupvpc-sg-ssh"
    description = "Allow SSH inbound traffic"
    vpc_id = aws_vpc.levelupvpc.id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.environment_tag
    }
}