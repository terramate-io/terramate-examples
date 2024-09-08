// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "CHANGE-THIS"
    encrypt = true
    key     = "state-files/stacks/e4790733-c105-4870-bdf7-9ab67fcc655c/terraform.state"
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
