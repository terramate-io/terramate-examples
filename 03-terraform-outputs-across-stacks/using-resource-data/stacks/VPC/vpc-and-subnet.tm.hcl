generate_hcl "_terramate_generated_vpc-and-subnet.tf" {
  content {
    resource "aws_vpc" "main" {
      cidr_block       = "10.0.0.0/16"
      instance_tenancy = "default"

      tags = {
        Name = global.name
      }
    }
    resource "aws_subnet" "main" {
      vpc_id     = aws_vpc.main.id
      cidr_block = "10.0.1.0/24"

      tags = {
        Name = global.name
      }
    }
  }
}
