terramate {
  required_version = ">= 0.11.1"
  config {

    # Optionally disable safe guards
    # Learn more: https://terramate.io/docs/cli/orchestration/safeguards
    # disable_safeguards = [
    #   "git-untracked",
    #   "git-uncommitted",
    #   "git-out-of-sync",
    #   "outdated-code",
    # ]

    cloud {
      # Configure the namespace of your Terramate Cloud organization
      #   organization = "YOUR_ORGANIZATION"

      # Opt in for the deployment targets feature
      targets {
        enabled = true
      }
    }

    run {
      env {
        TF_PLUGIN_CACHE_DIR = "${terramate.root.path.fs.absolute}/.tf_plugin_cache_dir"
      }
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
