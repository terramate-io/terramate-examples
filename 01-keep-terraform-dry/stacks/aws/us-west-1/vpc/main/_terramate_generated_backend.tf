// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend"
    dynamodb_table = "terraform_state"
    encrypt        = true
    key            = "terraform/stacks/by-id/2e03e2fb-ce5f-4c19-9757-e4636491a446/terraform.tfstate"
    region         = "us-east-1"
  }
}
