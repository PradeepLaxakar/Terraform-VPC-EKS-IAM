# Iam user ------------------------------------------------------------
resource "aws_iam_user" "eks-user" {
  name = "${var.name}-user"
}

# Console Access
resource "aws_iam_user_login_profile" "console-access" {
  user = aws_iam_user.eks-user.name
  #  password_reset_required  = true
}



# Policy for iam user -----------------------------------------------------
resource "aws_iam_user_policy" "AdministratorAccess" {
  name = "${var.name}-Policy-AdministratorAccess"
  user = aws_iam_user.eks-user.name

  # Terraform's "jsonencode" function converts a Terraform expression result to valid JSON syntax.
  policy = jsonencode({

    # Paste policy here   
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "*",
        "Resource" : "*"
      }
    ]
    # Policy end here
  })
}


