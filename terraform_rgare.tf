provider "aws" {
  region = var.region
}

resource "aws_cloudfront_distribution" "rgare_cdn" {
  origin {
    domain_name = 
