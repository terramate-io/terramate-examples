generate_hcl "dependencies.tf" {
  content {
    tm_dynamic "terraform_remote_state" {
      for_each = global.dependencies
      iterator = value
      labels   = ["vpc"]


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