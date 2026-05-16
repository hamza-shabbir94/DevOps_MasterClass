resource "aws_vpc" "levelupvpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"

  tags = {
    Name = "levelupvpc"
  }
}


# public subnets
resource "aws_subnet" "levelupvpc-public-1" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"

  tags = {
    Name = "levelupvpc-public-1"
  }
}
resource "aws_subnet" "levelupvpc-public-2" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"

  tags = {
    Name = "levelupvpc-public-2"
  }
}
resource "aws_subnet" "levelupvpc-public-3" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2c"

  tags = {
    Name = "levelupvpc-public-3"
  }
}

# private subnets
resource "aws_subnet" "levelupvpc-private-1" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.4.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2a"

  tags = {
    Name = "levelupvpc-private-1"
  }
}
resource "aws_subnet" "levelupvpc-private-2" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.5.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2b"

  tags = {
    Name = "levelupvpc-private-2"
  }
}
resource "aws_subnet" "levelupvpc-private-3" {
  vpc_id     = aws_vpc.levelupvpc.id
  cidr_block = "10.0.6.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-2c"

  tags = {
    Name = "levelupvpc-private-3"
  }
}

# internet gateway
resource "aws_internet_gateway" "levelupvpc-igw" {
  vpc_id = aws_vpc.levelupvpc.id

  tags = {
    Name = "levelupvpc-igw"
  }
}

# route table for public subnets
resource "aws_route_table" "levelupvpc-public-rt" {
  vpc_id = aws_vpc.levelupvpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelupvpc-igw.id
  }

  tags = {
    Name = "levelupvpc-public-rt"
  }
}

# associate public subnets with route table
resource "aws_route_table_association" "levelupvpc-public-1-assoc" {
  subnet_id      = aws_subnet.levelupvpc-public-1.id
  route_table_id = aws_route_table.levelupvpc-public-rt.id
}
resource "aws_route_table_association" "levelupvpc-public-2-assoc" {
  subnet_id      = aws_subnet.levelupvpc-public-2.id
  route_table_id = aws_route_table.levelupvpc-public-rt.id
}
resource "aws_route_table_association" "levelupvpc-public-3-assoc" {
  subnet_id      = aws_subnet.levelupvpc-public-3.id
  route_table_id = aws_route_table.levelupvpc-public-rt.id
}
