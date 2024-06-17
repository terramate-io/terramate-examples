terramate {
  required_version = ">= 0.9.0"
  config {
    disable_safeguards = [
      "git",
      # "outdated-code",
    ]

    # Enables the simplified adhoc HCL code generation
    # https://terramate.io/docs/cli/code-generation/tmgen
    experiments = [
      "tmgen"
    ]
  }
}
