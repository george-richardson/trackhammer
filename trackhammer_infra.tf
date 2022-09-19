terraform {
  backend "s3" {
    bucket = "gjhr-tfstate"
    key    = "trackhammer.gjhr.me"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = "eu-west-1"
}

provider "aws" {
  alias  = "useast1"
  region = "us-east-1"
}

module "static_site" {
  source = "git::https://github.com/george-richardson/terraform_s3_cloudfront_static_site.git?ref=2.0.1"

  providers = {
    aws.useast1 = aws.useast1
  }

  name           = "trackhammer.gjhr.me"
  bucket_name    = "trackhammer.gjhr.me-origin"
  hosted_zone_id = "Z05588463BUKUMZJDK84B"
}

