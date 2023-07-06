// Configure the main AWS Provider and an additional alias Provider to demonstrate multi-region setup
globals "terraform" "providers" "aws" {
  enabled = true
  source  = "hashicorp/aws"
  version = "~> 5.0"
  config = {
    region = "us-east-1"
  }
}

globals "terraform" "providers" "aws.west-1" {
  config = {
    region = "us-west-1"
  }
}
