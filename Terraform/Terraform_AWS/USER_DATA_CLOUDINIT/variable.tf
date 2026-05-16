variable "AWS_ACCESS_KEY" {

}

variable "AWS_SECRET_KEY" {

}

variable "AWS_REGION" {  
    default = "us-east-2"
}


variable "AMIS" {
    type = map
    default = {
        us-east-2 = "ami-0257f1929a4806405"
    }
  
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/USER_DATA_CLOUDINIT/levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/USER_DATA_CLOUDINIT/levelup_key.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}