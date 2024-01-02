# generates the backend.tf in each stack
generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
        bucket  = "data-sharing-state-bucket"
        key     = "${terramate.stack.path.relative}/terraform.state"
        region  = "us-west-2"
        encrypt = true
      }
    }
  }
}
