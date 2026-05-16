terraform {
  required_providers {
    template = {
      source  = "cloudposse/template" # This version supports darwin_arm64
      version = "2.2.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}

provider "aws" {
  # Configuration options
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region     = var.AWS_REGION
}
provider "template" {
  # Configuration 
  
}