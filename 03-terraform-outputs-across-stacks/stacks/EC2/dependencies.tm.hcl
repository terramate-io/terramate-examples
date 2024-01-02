generate_hcl "dependencies.tf" {
  content {
    tm_dynamic "data terraform_remote_state" {
      for_each = global.dependencies
      iterator = value
      labels   = ["vpc"]


      content {
        backend = "s3"

        config = {
          bucket  = "data-sharing-state-bucket"
          region  = "us-west-2"
          encrypt = true
          key     = "${value.value}/terraform.state"
        }
      }
    }
  }
}
