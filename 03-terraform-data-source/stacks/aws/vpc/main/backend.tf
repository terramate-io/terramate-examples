// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "CHANGETHIS-terramate-example-terraform-state-backend"
    dynamodb_table = "CHANGETHIS-terramate-example-terraform-state-backend"
    encrypt        = true
    key            = "terraform/stacks/by-id/fdcfb3-ce64-4ba2-bc1e-1ab22bceba35/terraform.tfstate"
    region         = "us-east-1"
  }
}
