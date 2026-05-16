terraform {
  backend "s3" {
    bucket = "terraform.state-577435557149-us-east-2-an"
    key    = "dataSource/terraform.tfstate"
    region = "us-east-2"
    
  }
}

# aws configure set aws_access_key_id <your_access_key>
# aws configure set aws_secret_access_key <your_secret_key>