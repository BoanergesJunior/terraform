terraform {
  required_version = ">=0.13.1"
  required_providers {
    aws   = ">=5.56.1"
    local = ">=2.5.1"
  }
  backend "s3" {
    bucket = "tfstate-bucket-fc"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
