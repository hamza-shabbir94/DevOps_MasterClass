# define external Ip
resource "aws_eip" "levelupvpc-nat-eip" {
  domain = "vpc"
}

# create NAT Gateway
resource "aws_nat_gateway" "levelupvpc-nat-gateway" {
  allocation_id = aws_eip.levelupvpc-nat-eip.id
  subnet_id     = aws_subnet.levelupvpc-public-1.id
  depends_on    = [aws_internet_gateway.levelupvpc-igw]
}

resource "aws_route_table" "levelupvpc-private-rt" {
  vpc_id = aws_vpc.levelupvpc.id
  route { 
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.levelupvpc-nat-gateway.id
  
}

  tags = {
    Name = "levelupvpc-private-rt"
  }
}

# associate private subnets with private route table
resource "aws_route_table_association" "levelupvpc-private-1-association" {
  subnet_id      = aws_subnet.levelupvpc-private-1.id
  route_table_id = aws_route_table.levelupvpc-private-rt.id
}
resource "aws_route_table_association" "levelupvpc-private-2-association" {
  subnet_id      = aws_subnet.levelupvpc-private-2.id
  route_table_id = aws_route_table.levelupvpc-private-rt.id
}
resource "aws_route_table_association" "levelupvpc-private-3-association" {
  subnet_id      = aws_subnet.levelupvpc-private-3.id
  route_table_id = aws_route_table.levelupvpc-private-rt.id
}