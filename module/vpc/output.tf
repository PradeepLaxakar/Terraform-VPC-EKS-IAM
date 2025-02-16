output "vpc-name" {
  value = module.vpc.name
}

output "vpc-id" {
  value = module.vpc.vpc_id
}

output "public-subnets" {
  value = module.vpc.public_subnets
}
