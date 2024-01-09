// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "CHANGE-THIS"
    encrypt = true
    key     = "state-files/stacks/c2c67b6a-5cc5-4129-b684-f471548781d5/terraform.state"
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
