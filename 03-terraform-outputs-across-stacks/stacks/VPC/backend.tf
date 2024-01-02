// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "data-sharing-state-bucket"
    encrypt = true
    key     = "stacks/vpc/terraform.state"
    region  = "us-west-2"
  }
}
