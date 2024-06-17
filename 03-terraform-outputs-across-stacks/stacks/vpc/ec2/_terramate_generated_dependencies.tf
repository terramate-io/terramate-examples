// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket  = "my-terraform-state-bucket"
    encrypt = true
    key     = "terraform/states/by-id/c2c67b6a-5cc5-4129-b684-f471548781d5/terraform.state"
    region  = "us-west-2"
  }
  depends_on = [
    null_resource.initial_deployment_trigger,
  ]
}
resource "null_resource" "initial_deployment_trigger" {
}
