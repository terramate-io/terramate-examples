globals {
  aws_region = "us-west-2"
  name       = "terramate-example-data-sharing"
  state_bucket = {
    key_fmt = "state-files/stacks/%s/terraform.state"
    name    = "CHANGE-THIS"
  }
}

# generates the backend.tf in each stack
generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket  = global.state_bucket.name
        key     = tm_format(global.state_bucket.key_fmt, terramate.stack.id)
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
