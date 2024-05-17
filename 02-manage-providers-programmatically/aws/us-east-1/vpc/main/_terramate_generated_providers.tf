// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = "1.6.0"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.29"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
provider "cloudflare" {
  api_key     = data.sops_file.secrets.data.CLOUDFLARE_API_KEY
  email       = data.sops_file.secrets.data.CLOUDFLARE_EMAIL
  some_config = true
}
provider "aws" {
  region = "us-west-1"
  alias  = "west-1"
}
