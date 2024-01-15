// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  hash_key       = "LockID"
  name           = "CHANGETHIS-terramate-example-terraform-state-backend"
  read_capacity  = 20
  write_capacity = 20
  attribute {
    name = "LockID"
    type = "S"
  }
}
resource "aws_s3_bucket" "tf_backend" {
  bucket        = "CHANGETHIS-terramate-example-terraform-state-backend"
  force_destroy = true
}
