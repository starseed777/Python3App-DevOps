provider "aws" {
  version = "~> 3.0"
  region  = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "backupjawnt"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "dynamojawnt"
  }
}

module "jenkinsenvironment" {
  source = "./vpcmod"
}



