variable "region" {
   default = "us-west-2"
}
variable "cidr" {
  cidr_block = ["10.119.23.42/16", "10.112.23.34/24"]
}

variable "subnets" {
   subnets = ["subnet_a", "subnet_b"]
}

variable "domain_name" {
   default = "rgare_domain-s3.aws.com"
}



