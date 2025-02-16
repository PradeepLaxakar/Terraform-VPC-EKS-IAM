# ecr module ---------------------------------------------
module "ecr" {
  source = "./module/ecr"
  name   = var.name
  region = var.region
}


# vpc module ---------------------------------------------
module "vpc" {
  source = "./module/vpc"
  name   = var.name
  region = var.region
}


# iam module ---------------------------------------------
module "iam" {
  source = "./module/iam"
  name   = var.name
}


# eks module ---------------------------------------------
module "eks" {
  source     = "./module/eks"
  name       = var.name
  region     = var.region
  vpc-id     = module.vpc.vpc-id
  subnet-ids = module.vpc.public-subnets # eks cluster to make in public or private subnet 
}



