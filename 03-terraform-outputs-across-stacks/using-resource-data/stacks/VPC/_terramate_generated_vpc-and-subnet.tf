// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "terramate-example-data-sharing"
  }
}
resource "aws_subnet" "main" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "terramate-example-data-sharing"
  }
  vpc_id = aws_vpc.main.id
}
