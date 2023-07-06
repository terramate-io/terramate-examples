resource "aws_vpc" "main" {
  provider = aws.west-1

  cidr_block = "10.0.0.0/16"
}
