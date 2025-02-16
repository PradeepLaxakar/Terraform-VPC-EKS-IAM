# root module variable -----------------------
variable "name" {}

variable "region" {}

variable "vpc-id" {}

variable "subnet-ids" {}


# eks variable ------------------
variable "cluster-version" {
  default = "1.30"
}

variable "instance-type" {
  type    = list(string)
  default = ["t3.medium"] # For Stage & Prod
  #    default = ["t2.micro"]          # For Testing

}

# variable ami-type {
#     default = "ami-0f30a9c3a48f3fa79" # Ubuntu 22.04 Ohio AMI
# }


variable "desired-size" {
  default = "3"
}

variable "max-size" {
  default = "3"
}

variable "min-size" {
  default = "3"
}

