// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "data-sharing-state-bucket"
    encrypt = true
    key     = "03-terraform-outputs-across-stacks/stacks/EC2/terraform.state"
    region  = "us-west-2"
  }
}
