
#
# Generate the Terraform S3 Backend configuration
#

# The backend logic depends on a global map to set the backend config
#
# global.terraform.backend.s3.bucket - The state bucket name
# ----------------------------------------------------------
#
#   This global value is required to exist.
#
#      global "terraform" "backend" "s3" {
#        bucket = "my-bucket"
#      }
#
# global.terraform.backend.s3.region - The state bucket region
# ------------------------------------------------------------
#
#   This global value is required to exist.
#
#      global "terraform" "backend" "s3" {
#        region = "us-west-2"
#      }
#
generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket  = global.terraform.backend.s3.bucket
        key     = "terraform/states/by-id/${terramate.stack.id}/terraform.state"
        region  = global.terraform.backend.s3.region
        encrypt = true
      }
    }
  }

  # improve UX by defining better error messages in case required configuration is missing

  assert {
    assertion = tm_length(tm_try(global.terraform.backend.s3.bucket, "")) > 0
    message   = "Terramate Global Variable terraform.backend.s3.bucket is required, but not set"
  }

  assert {
    assertion = tm_length(tm_try(global.terraform.backend.s3.region, "")) > 0
    message   = "Terramate Global Variable terraform.backend.s3.region is required, but not set"
  }
}
