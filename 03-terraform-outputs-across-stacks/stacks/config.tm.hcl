# generates the backend.tf in each stack
generate_hcl "backend.tf" {
  content {
    terraform {
      backend "s3" {
      bucket = "mybucket"
      key    = "${terramate.stack.path.relative}/terraform.state"
      region = "us-east-1"
      encrypt = true
     }
  }
  }
}