# Variable
variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default = "10.1.0.0/16"
}

variable "cidr_subnet" {
    description = "CIDR block for the subnets"
    default = "10.1.1.0/24"
}

variable "availability_zone" {
    description = "Availability zone for the subnet"
    default = "us-east-2a"
}

variable "public_key_path" {
    description = "Path to the public key for SSH access"
    default = "~/.ssh/levelup_key.pub"
  
}

variable "environment_tag" {
    description = "Environment tag for resources"
    default = "Production"
}