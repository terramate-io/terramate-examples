// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "CHANGE-THIS"
    encrypt = true
    key     = "state-files/stacks/9d2b1b15-0ea2-45cd-9573-90fe67bdafda/terraform.state"
    region  = "us-west-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "us-west-2"
}
