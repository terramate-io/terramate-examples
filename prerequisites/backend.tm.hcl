globals "terraform" "backend" {
  bucket = "${global.prefix}-terramate-example-terraform-state-backend"
  region = "us-east-1"
}

generate_hcl "_prerequisites.tf" {
  content {
    resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
      name           = global.terraform.backend.bucket
      hash_key       = "LockID"
      read_capacity  = 20
      write_capacity = 20

      attribute {
        name = "LockID"
        type = "S"
      }
    }

    resource "aws_s3_bucket" "tf_backend" {
      bucket = global.terraform.backend.bucket

      force_destroy = true
    }
  }
}

