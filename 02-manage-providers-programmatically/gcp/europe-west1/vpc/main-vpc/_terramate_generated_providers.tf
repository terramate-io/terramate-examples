// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

terraform {
  required_version = "1.6.0"
}
terraform {
  required_providers {
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
provider "gcp" {
  project = "my-project-id"
  region  = "europe-west1"
}
