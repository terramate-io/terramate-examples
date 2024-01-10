// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

data "aws_subnet" "vpc" {
  filter {
    name = "tag:Name"
    values = [
      "terramate-example-data-sharing",
    ]
  }
}
