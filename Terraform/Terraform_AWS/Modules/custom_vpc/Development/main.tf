module "dev-vpc"{
    source                          = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/Modules/custom_vpc"
    AWS_ACCESS_KEY                  = var.AWS_ACCESS_KEY
    AWS_SECRET_KEY                  = var.AWS_SECRET_KEY
    vpcname                         = "dev01-vpc"
    cidr                            = "10.0.2.0/24"
    enable_dns_support              = "true"
    enable_classiclink              = "false"
    enable_classiclink_dns_support  = "false"
    enable_ipv6                     = "true"
    vpcenvironment                  = "Development-Engineering"

}