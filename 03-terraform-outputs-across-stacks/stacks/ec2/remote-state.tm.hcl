generate_hcl "_terramate_generated_remote_state.tf" {
  content {
    data "terraform_remote_state" "vpc" {
      backend = "s3"
      config = {
        bucket  = global.state_bucket.name
        region  = global.aws_region
        encrypt = true
        # The key here uses the stack ID of the VPC stack
        key = tm_format(global.state_bucket.key_fmt, "c2c67b6a-5cc5-4129-b684-f471548781d5")
      }
    }
  }
}
