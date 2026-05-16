# RDS Resources
resource "aws_db_subnet_group" "mariadb_subnet_group" {
  name       = "mariadb-subnet"
  subnet_ids = [aws_subnet.levelupvpc-private-1.id, aws_subnet.levelupvpc-private-2.id, aws_subnet.levelupvpc-private-3.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_db_parameter_group" "mariadb_parameter_group" {
  name = "mariadb-parameter-group"
  family = "mariadb10.5"
  description = "Custom parameter group for MariaDB"
  parameter {
    name = "max_allowed_packet"
    value = "16777216"
  }
}

# RDS instance
resource "aws_db_instance" "mariadb_instance" {
  identifier = "mariadb-instance"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mariadb"
  engine_version = "10.5"
  instance_class = "db.t3.micro"
  db_name = "mydb"
  username = "root"
  password = "password123"
  db_subnet_group_name = aws_db_subnet_group.mariadb_subnet_group.name
  vpc_security_group_ids = [aws_security_group.allow-mariadb.id]
  parameter_group_name = aws_db_parameter_group.mariadb_parameter_group.name
  skip_final_snapshot = true
  multi_az = false

    tags = {
        Name = "MariaDB Instance"
    }
}

output "rds" {
  value = aws_db_instance.mariadb_instance.endpoint
}