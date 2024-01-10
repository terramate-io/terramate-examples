#
# Generate the Terraform Providers configuration
#

# The providers logic depends on a global map to set the config
#
# global.terraform.provider.aws.version - The aws provider version constraint
# ---------------------------------------------------------------------------
#
#   This global value is required to exist.
#
#      global "terraform" "provider" "aws" {
#        version = "my-bucket"
#      }
#
# global.terraform.provider.aws.region - The provider region
# ----------------------------------------------------------
#
#   This global value is required to exist.
#
#      global "terraform" "provider" "aws" {
#        region = "us-west-2"
#      }
#

generate_hcl "_terramate_generated_providers.tf" {
  content {
    terraform {
      required_providers {
        aws = {
          source  = "hashicorp/aws"
          version = global.terraform.provider.aws.version
        }
      }
    }

    provider "aws" {
      region = global.terraform.provider.aws.region
    }
  }

  # improve UX by defining better error messages in case required configuration is missing

  assert {
    assertion = tm_length(tm_try(global.terraform.provider.aws.version, "")) > 0
    message   = "Terramate Global Variable terraform.provider.aws.version is required, but not set"
  }

  assert {
    assertion = tm_length(tm_try(global.terraform.provider.aws.region, "")) > 0
    message   = "Terramate Global Variable terraform.provider.aws.region is required, but not set"
  }
}
