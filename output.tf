
# vpc module output ----------------------------------------
output "vpc-id" {
  value = module.vpc.vpc-id
}

output "public-subnets" {
  value = module.vpc.public-subnets
}



# iam module output ------------------------------------------
output "iam-user-name" {
  value = module.iam.user-name
}

output "iam-user-arn" {
  value = module.iam.user-arn
}

# to see password - terraform output --raw iam-user-password
output "iam-user-password" {
  value     = module.iam.password
  sensitive = true
}



# eks module outputs ------------------------------------------------
output "eks-cluster-name" {
  value = module.eks.eks-cluster-name
}