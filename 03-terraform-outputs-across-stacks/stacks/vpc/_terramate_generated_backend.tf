// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket"
    encrypt = true
    key     = "terraform/states/by-id/c2c67b6a-5cc5-4129-b684-f471548781d5/terraform.state"
    region  = "us-west-2"
  }
}
