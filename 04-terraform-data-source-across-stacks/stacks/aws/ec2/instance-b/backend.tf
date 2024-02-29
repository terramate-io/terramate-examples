// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend"
    dynamodb_table = "terraform-lock"
    encrypt        = true
    key            = "terraform/stacks/by-id/249e7f6-dcbc-4038-8a94-012aa17c081f/terraform.tfstate"
    region         = "us-east-1"
  }
}
