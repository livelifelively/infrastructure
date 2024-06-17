terraform {
  required_version = "~> 1.3"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {}
}

provider "aws" {
  region = "ap-south-1"
}

module "tf-state" {
  source = "./modules/tf-state"

  bucket         = "tf-state-bucket.infra.all"
  dynamodb_table = "tf_state_locking.infra.all"
  key            = "tf_infra/terraform.tfstate"
  region         = "ap-south-1"
}

module "tf-state-ezybots" {
  source = "./modules/tf-state"

  bucket         = "tf-state-bucket.ezybots.com"
  key            = "tf_infra/terraform.tfstate"
  region         = "ap-south-1"
  dynamodb_table = "tf_state_locking.ezybots.com"
}

module "tf-state-kartvya" {
  source = "./modules/tf-state"

  bucket         = "tf-state-bucket.kartvya.com"
  key            = "tf_infra/terraform.tfstate"
  region         = "ap-south-1"
  dynamodb_table = "tf_state_locking.kartvya.com"
}
