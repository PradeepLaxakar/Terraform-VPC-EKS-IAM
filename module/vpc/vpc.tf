module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.name
  cidr = var.cidr-block

  azs                     = ["${var.region}a", "${var.region}b", ]
  private_subnets         = var.private-subnets
  public_subnets          = var.public-subnets
  map_public_ip_on_launch = true

  #  enable_nat_gateway = true
  #  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "${var.name}"
  }
}

