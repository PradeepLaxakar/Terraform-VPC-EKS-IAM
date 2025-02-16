# output "eks_admin_role_arn" {
#   value = aws_iam_role.eks_admin_role.arn
# }


# ekscloud
output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}


output "eks-cluster-name" {
  value = aws_eks_cluster.eks.name
}