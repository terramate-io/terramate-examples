terramate {
  required_version = ">= 0.9.0"
  config {

    cloud {
      # Configure the namespace of your Terramate Cloud organization
      #   organization = "YOUR_ORGANIZATION"

      # Opt in for the deployment targets feature
      targets {
        enabled = true
      }
    }

    git {
      # Optionally disable git safe guards
      # Learn more: https://terramate.io/docs/cli/orchestration/safeguards
      # check_remote      = false
      # check_untracked   = false
      # check_uncommitted = false
    }

    run {
      env {
        TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.tf_plugin_cache_dir"
      }

      # Optionally disable code generation safe guard
      # Learn more: https://terramate.io/docs/cli/orchestration/safeguards
      # check_gen_code = true
    }

    # Enables the simplified adhoc HCL code generation
    # https://terramate.io/docs/cli/code-generation/tmgen
    experiments = [
      "tmgen",
      "scripts",
      "targets",
    ]
  }
}
