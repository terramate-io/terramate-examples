// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = "1.6.0"
}
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.29"
    }
    gcp = {
      source  = "hashicorp/google"
      version = "~> 5.6"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.5"
    }
  }
}
provider "cloudflare" {
  api_key     = data.sops_file.secrets.data.CLOUDFLARE_API_KEY
  email       = data.sops_file.secrets.data.CLOUDFLARE_EMAIL
  some_config = true
}
provider "gcp" {
  project = "my-project-id"
  region  = "europe-west1"
}
