globals "terraform" "providers" "gcp" {
  enabled = true
  source  = "hashicorp/google"
  version = "~> 5.6"
  config = {
    project     = "my-project-id"
    region      = "europe-west1"
  }
}
