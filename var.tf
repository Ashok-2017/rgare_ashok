variable "region" {
   default = "us-west-2"
}
variable "cidr" {
  default = ["10.119.23.42/16", "10.112.23.34/24"]
}

variable "subnets" {
   default = ["subnet_a", "subnet_b"]
}

variable "domain_name" {
   default = "rgare_domain-s3.aws.com"
}

variable "vpc_id" {
   default = " "
}



