# Get the latest RHEL 9.4 ami for the region 
data "aws_ami" "rhel9-4-ami-latest" {
  owners      = ["309956199498"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9.4.*_HVM*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnets" "default-vpc-subnets" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

data "aws_route53_zone" "my_aws_dns_zone" {
  name = var.hosted_zone_name
}

data "aws_iam_policy" "SecurityComputeAccess" {
  name = "SecurityComputeAccess"
}
