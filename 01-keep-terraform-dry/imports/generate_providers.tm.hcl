generate_hcl "_terramate_generated_provider.tf" {
  content {
    terraform {
      required_version = global.terraform.version

      required_providers {
        random = {
          source  = "hashicorp/random"
          version = global.terraform.providers.random.version
        }
      }
    }
  }
}
