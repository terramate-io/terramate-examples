generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        region         = global.terraform.backend.region
        bucket         = global.terraform.backend.bucket
        key            = "terraform/stacks/by-id/${terramate.stack.id}/terraform.tfstate"
        encrypt        = true
        dynamodb_table = tm_try(global.terraform.backend.dynamo_table, global.terraform.backend.bucket)
      }
    }
  }
}
