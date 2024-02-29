globals "terraform" {
  version = "1.6.6"
}

globals "terraform" "backend" {
  bucket = "terramate-example-terraform-state-backend"
  region       = "us-east-1"
}
