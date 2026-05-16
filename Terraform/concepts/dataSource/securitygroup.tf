data "aws_ip_ranges" "us_east_ip_range" {
  regions = ["us-east-1","us-east-2"]
  services = ["ec2"]

}

resource "aws_security_group" "sg_custom_us_east" {
    name = "sg_custom_us_east"

    ingress  {
        from_port = "443"
        to_port = "443"
        protocol = "tcp"
        cidr_blocks = slice(data.aws_ip_ranges.us_east_ip_range.cidr_blocks, 0, 50) # When you assign data.aws_ip_ranges.us_east_ip_range.cidr_blocks directly to the cidr_blocks argument within a single ingress block, Terraform attempts to create an ingress rule for each individual CIDR block in the list. 
                                                                                    # AWS enforces a strict limit of 60 rules per security group, and this list significantly exceeds that threshold
    }

    tags = {
      createDate = data.aws_ip_ranges.us_east_ip_range.create_date
      SynvToken = data.aws_ip_ranges.us_east_ip_range.sync_token
    }
}