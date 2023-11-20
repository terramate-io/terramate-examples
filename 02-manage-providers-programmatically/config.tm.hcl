// Configure default Terraform version and default providers
globals "terraform" {
  version = "1.6.0"
}

# Will be added to all stacks
globals "terraform" "providers" "random" {
  source  = "hashicorp/random"
  version = "~> 3.5"
  enabled = true
}
