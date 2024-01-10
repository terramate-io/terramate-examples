// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "CHANGE-THIS"
    region  = "us-west-2"
    encrypt = true
    key     = "state-files/stacks/c2c67b6a-5cc5-4129-b684-f471548781d5/terraform.state"
  }
}
