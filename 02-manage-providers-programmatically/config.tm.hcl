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

globals "terraform" "providers" "cloudflare" {
  source  = "cloudflare/cloudflare"
  version = "~> 4.29"
  enabled = true
  
  config = {
    some_config = true
  }

  config_partial = {
    api_key = "data.sops_file.secrets.data.CLOUDFLARE_API_KEY"
    email   = "data.sops_file.secrets.data.CLOUDFLARE_EMAIL"
  }
}
