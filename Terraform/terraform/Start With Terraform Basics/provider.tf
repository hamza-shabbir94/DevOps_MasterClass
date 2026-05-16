## Provider's Example


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.71.0"
    }
  }
}

provider "aws" {
    access_key = ""
    secret_key = ""
    region     = "us-east-2"
}


provider "azurerm" {
  # Configuration options
}
