// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "CHANGETHIS-terramate-example-terraform-state-backend"
    dynamodb_table = "CHANGETHIS-terramate-example-terraform-state-backend"
    encrypt        = true
    key            = "terraform/stacks/by-id/ffca51f-1666-4572-b838-10634354b85c/terraform.tfstate"
    region         = "us-east-1"
  }
}
