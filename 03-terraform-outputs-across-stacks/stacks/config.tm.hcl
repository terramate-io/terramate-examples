
# configure terraform backend
globals "terraform" "backend" "s3" {
  region = "us-west-2"
  bucket = "my-terraform-state-bucket"
}

# configure AWS provider
globals "terraform" "provider" "aws" {
  region  = "us-west-2"
  version = "~> 5.0"
}
