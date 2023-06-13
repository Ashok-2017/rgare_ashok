provider "aws" {
  region = "${var.region}"
}

resource "aws_cloudfront_distribution" "rgare_cdn" {
  origin {
    domain_name = "{var.domain_name}"
    origin_id = "s3-origin"
  }
enabled = true 
is_ipv4_enabled = true
comment = "CDN distribution for my static content"
price_class = "PriceClass_100" # Chose this based on latency
default_root_object = "index.html"

default_cache_behaviour {
  allowed_methods = ["GET", "HEAD"]
  cached_methods = ["GET", "HEAD"]
  target_origin_id = "s3-origin"
  
  forwarded_values {
    query_string = false
    cookies {
      forward = "none"
    }
  }
  viewer_protocol_policy = "redirect-to-https"
}
restrictions {
  geo_restriction {
    restriction_type = none
  }
}
viewer_certificate {
  cloudfront_default_certificate = true
}
  
resource "aws_security_group" "rgare-sg" {
  name = "rgare-sg"
  description = "Allow inbound HTTP trafic"

  ingree {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = "{var.cidr}"
  }
}
# Create an ALB
resource "aws_lb" "rgare_lb" {
  name = "rgare_lb"
  load_balancer_type = "application"
  security_groups = ["aws-security_group.rgare-sg.id"]
  subnets = "${var.subnets}"
}
# Create a target group
resource "aws_lb_target_group" "rgare_target_group" {
  name = "rgare_target_group"
  port = 80
  protocol = "HTTP"
  vpc = "{var.vpc_id}"
}
  
resource "aws_instance" "rgare" {
  ami = "${var.instance_id}
  instance_type = "{var.instance}"
  
  tags = {
     Name = "rgare_instance"
     }

resource "aws_lb_target_group_attachment" "rgare_target_group_attachment" {
  target_group_arn = aws_lb_target_group.rgare_target_group.arn
  target_id = "${var.instance_name}"
  }
  
  # Create a listener
  resource "aws_lb_listener" "rgare_listener" {
    load_balancer_arn = aws_lb.rgare_lb.arn
    port = 80
    protocol = "HTTP"
    default_action {
      target_group_arn = aws_lb_target_group.rgare_target_group.arn
      type = "forward"
    }
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  

