variable "AWS_ACCESS_KEY" {

}

variable "AWS_SECRET_KEY" {

}

 variable "AWS_REGION" {  
     default = "us-east-1"
}


# variable "AMIS" {
#     type = map
#     default = {
#         us-east-2 = "ami-0fe18bc3cfa53a248"
#         us-west-2 = "ami-0352d5a37fb4f603f"
#         us-west-1 = "ami-0f40c8f97004632f9"
#     }
  
# }

# variable "PATH_TO_PRIVATE_KEY" {
#   default = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/IAM_ROLEs/levelup_key"
# }

# variable "PATH_TO_PUBLIC_KEY" {
#   default = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/IAM_ROLEs/levelup_key.pub"
# }
# variable "INSTANCE_USERNAME" {
#   default = "ubuntu"
# }


variable "vpcname" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "0.0.0.0/0"
}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type        = string
  default     = "default"
}

variable "enable_dns_hostnames" {
  description = "Should be true to enable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "enable_dns_support" {
  description = "Should be true to enable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "enable_classiclink" {
  description = "Should be true to enable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_classiclink_dns_support" {
  description = "Should be true to enable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic."
  type        = bool
  default     = null
}

variable "enable_ipv6" {
  description = "Requests an Amazon-provided IPv6 CIDR block."
  type        = bool
  default     = false
}

variable "vpcenvironment" {
  description = "AWS VPC Environment Name"
  type        = string
  default     = "Development"
}
