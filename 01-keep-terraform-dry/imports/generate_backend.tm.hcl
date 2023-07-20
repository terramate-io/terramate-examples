generate_hcl "_terramate_generated_backend.tf" {
  content {
    terraform {
      backend "s3" {
        region         = global.terraform.backend.s3.region
        bucket         = global.terraform.backend.s3.bucket
        key            = "terraform/stacks/by-id/${terramate.stack.id}/terraform.tfstate"
        encrypt        = true
        dynamodb_table = "terraform_state"
      }
    }
  }
}
