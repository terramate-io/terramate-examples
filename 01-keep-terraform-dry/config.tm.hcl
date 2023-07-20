// Configure default Terraform version and default providers
globals "terraform" {
  version = "1.5.1"
}

globals "terraform" "backend" "s3" {
  region = "us-east-1"
  bucket = "terramate-example-terraform-state-backend"
}

globals "terraform" "providers" "random" {
  version = "~> 3.5"
}
