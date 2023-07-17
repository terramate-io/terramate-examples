// Configure default Terraform version and default providers
globals "terraform" {
  version = "1.5.1"
}

globals "terraform" "backend" "s3" {
  bucket = "terramate-example-terraform-state-backend"
}

# Will be added to all stacks
globals "terraform" "providers" "random" {
  source  = "hashicorp/random"
  version = "~> 3.5"
  enabled = true
}
