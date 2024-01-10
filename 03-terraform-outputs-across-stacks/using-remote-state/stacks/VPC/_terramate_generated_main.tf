// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = local.name
  }
}
resource "aws_subnet" "main" {
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "terramate-example-data-sharing"
  }
  vpc_id = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.main.id
}
