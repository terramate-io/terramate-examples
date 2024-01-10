// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "CHANGE-THIS"
    encrypt = true
    key     = "state-files/stacks/fd944951-2497-4a75-a93c-f486975c3777/terraform.state"
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
