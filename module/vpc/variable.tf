# root module variable --------------------------
variable "name" {}

variable "region" {}




# vpc module variable --------------------------------
variable "cidr-block" {
  default = "10.0.0.0/16"
}

variable "private-subnets" {
  type    = list(string)
  default = ["10.0.1.0/24"] #, "10.0.2.0/24"]
}

variable "public-subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}
