// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = "1.6.0"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
provider "aws" {
  region = "us-west-1"
  alias  = "west-1"
}
