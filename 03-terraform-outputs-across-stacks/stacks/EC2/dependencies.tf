// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "data-sharing-state-bucket"
    region  = "us-west-2"
    encrypt = true
    key     = "stacks/vpc/terraform.state"
  }
}
