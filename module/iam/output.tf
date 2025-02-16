output "user-name" {
  value = aws_iam_user.eks-user.name
}

output "user-arn" {
  value = aws_iam_user.eks-user.arn
}


output "password" {
  value     = aws_iam_user_login_profile.console-access.password
  sensitive = true
}


