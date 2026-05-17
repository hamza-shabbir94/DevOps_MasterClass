# module
module "myvpc" {
  source = "/Users/hamza/Hamza/all_work/DevOps_MasterClass/Terraform/Terraform_AWS/Network_module/module/network"
}

# resource key pair
resource "aws_key_pair" "levelup_key" {
  key_name   = "levelup_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "levelup_instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type
  key_name      = aws_key_pair.levelup_key.key_name
  subnet_id     = module.myvpc.public_subnet_id
  vpc_security_group_ids = ["${module.myvpc.sg_22_id}"]
  
    tags = {
        Environment = var.environment_tag 
    }
}