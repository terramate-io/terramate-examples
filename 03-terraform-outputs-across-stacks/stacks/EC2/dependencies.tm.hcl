generate_hcl "dependencies.tf" {
  content {
    tm_dynamic "terraform_remote_state" "vpc" {
      for_each = global.dependencies

      content {
        backend = "s3"

        config = {
          bucket  = "mybucket"
          region  = "us-east-1"
          encrypt = true
          key     = "${value.value}/terraform.state"
        }
      }
    }
   }
  }
}