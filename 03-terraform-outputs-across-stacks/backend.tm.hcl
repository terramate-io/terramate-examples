globals {
  aws_region   = "us-west-2"
  name         = "terramate-example-data-sharing"
  state_bucket = "CHANGE-THIS"
}

# generates the backend.tf in each stack
generate_hcl "_backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket  = global.state_bucket
        key     = "state-files/stacks/${terramate.stack.id}/terraform.state"
        region  = global.aws_region
        encrypt = true
      }

      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = "~> 5.0"
        }
      }
    }

    provider "aws" {
      region = global.aws_region
    }
  }
}
