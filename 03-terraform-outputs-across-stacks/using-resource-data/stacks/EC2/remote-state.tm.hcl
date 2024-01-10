generate_hcl "_data.tf" {
  content {
    data "aws_subnet" "vpc" {
      filter {
        name = "tag:Name"
        values = [
          global.name,
        ]
      }
    }
  }
}
