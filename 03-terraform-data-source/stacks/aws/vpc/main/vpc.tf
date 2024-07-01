// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
resource "aws_subnet" "main" {
  availability_zone = "us-east-1a"
  cidr_block        = "10.0.1.0/24"
  tags = {
    Name = "us-east-1a"
  }
  vpc_id = aws_vpc.main.id
}
output "subnet_id" {
  value = aws_subnet.main.id
}
