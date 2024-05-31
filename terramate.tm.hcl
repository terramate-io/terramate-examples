terramate {
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
