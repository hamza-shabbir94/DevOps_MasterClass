# Phase
# Write terraform Config
# Plan Infrastructure
# Deploy

# write IAC
terraform init  # initialize the working dir that contains you code, It will aslo download the component plugin, modules also create setup backup to store terraform state files
terraform plan  # read the code and then creates and shows a pla of execution/deployment
terraform apply # all start deploying the resources


terraform destroy # delete the resources, Should be used carefully because you can not revert it

# provider release very frequenct


export TF_LOG=TRACE