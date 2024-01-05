generate_hcl "_remote-state.tf" {
  content {
    data "terraform_remote_state" "vpc" {
      backend = "s3"
      config = {
        bucket  = global.state_bucket
        region  = global.aws_region
        encrypt = true
        # The key here uses the stack ID of the VPC stack
        key = "state-files/stacks/c2c67b6a-5cc5-4129-b684-f471548781d5/terraform.state"
      }
    }
  }
}
