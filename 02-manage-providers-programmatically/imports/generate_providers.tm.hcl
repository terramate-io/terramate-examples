generate_hcl "_terramate_generated_providers.tf" {

  lets {
    required_providers = { for k, v in tm_try(global.terraform.providers, {}) :
      k => {
        source  = v.source
        version = v.version
        } if tm_alltrue([
          tm_try(v.enabled, true),
          tm_length(tm_split(".", k)) == 1,
      ])
    }

    providers = { for k, v in tm_try(global.terraform.providers, {}) :
      k => {config = tm_try(v.config, {}), config_partial = tm_try(v.config_partial, {})} if tm_alltrue([
        tm_length(tm_split(".", k)) == 1,
        tm_try(v.enabled, true),
        tm_can(v.config) || tm_can(v.config_partial)
      ])
    }

    providers_aliases = { for k, v in tm_try(global.terraform.providers, {}) :
      k => v.config if tm_alltrue([
        tm_length(tm_split(".", k)) == 2,
        tm_try(v.enabled, true),
        tm_can(v.config) || tm_can(v.config_partial)
      ])
    }
  }

  content {
    # terraform version constraints
    terraform {
      required_version = tm_try(global.terraform.version, "~> 1.5")
    }

    # Provider version constraints
    terraform {
      tm_dynamic "required_providers" {
        attributes = let.required_providers
      }
    }

    # Provider configs
    tm_dynamic "provider" {
      for_each   = let.providers
      labels     = [provider.key]
      attributes = tm_merge(
        tm_try(provider.value.config, {}),
        tm_try({for k, v in provider.value.config_partial : k => tm_hcl_expression(v)}, {}),
      )
    }

    # Provider aliases
    tm_dynamic "provider" {
      for_each   = let.providers_aliases
      labels     = [tm_split(".", provider.key)[0]]
      attributes = provider.value

      content {
        alias = tm_split(".", provider.key)[1]
      }
    }
  }
}
