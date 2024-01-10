// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket"
    encrypt = true
    key     = "terraform/states/by-id/fd944951-2497-4a75-a93c-f486975c3777/terraform.state"
    region  = "us-west-2"
  }
}
