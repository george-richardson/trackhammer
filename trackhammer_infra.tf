terraform {
  backend "s3" {
    bucket = "george-richardson-tfstate"
    key    = "trackhammer.gjhr.me"
    region = "eu-west-2"
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
  source = "git::https://github.com/george-richardson/terraform_s3_cloudfront_static_site.git?ref=1.1.0"

  providers {
    aws.useast1 = "aws.useast1"
  }

  name           = "trackhammer.gjhr.me"
  hosted_zone_id = "Z15BU6M9B86ACI"
  region         = "eu-west-1"

  tags = {
    website = "trackhammer.gjhr.me"
  }
}
