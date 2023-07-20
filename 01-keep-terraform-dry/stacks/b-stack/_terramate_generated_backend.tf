// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  backend "s3" {
    bucket         = "terramate-example-terraform-state-backend"
    dynamodb_table = "terraform_state"
    encrypt        = true
    key            = "terraform/stacks/by-id/6e30a6fc-8dbd-40e1-a51d-20bc227a91f8/terraform.tfstate"
    region         = "us-east-1"
  }
}
