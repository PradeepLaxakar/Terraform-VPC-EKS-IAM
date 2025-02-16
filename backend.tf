# # tf state file backup on s3 -----------------------------------------------

provider "aws" {}

terraform {
  backend "s3" {
    # # bucket name added in backend-<prod/stage>.tfvars file. 
    key                      = "state-file-backup/Terraform-state-file"
    region                   = "us-east-1"
    shared_credentials_files = ["~/.aws/credentials"]
  }
}
