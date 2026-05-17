variable "region" {
  default = "us-east-2"
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "Public Key path"
  default = "/Users/hamza/.ssh/levelup_key.pub"
}

variable "instance_ami" {
  description = "AMI for aws EC2"
  default = "ami-0fe18bc3cfa53a248"
}

variable "instance_type" {
  description = "type for aws ec2 instance"
  default = "t3.micro"
}

variable "environment_tag" {
    description = "Environment tag for resources"
    default = "Production"
}