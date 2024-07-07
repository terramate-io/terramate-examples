generate_hcl "vpc.tf" {
  stack_filter {
    project_paths = [
    "vpc/*"]
  }

  content {
    resource "aws_vpc" "main" {
      cidr_block = "10.0.0.0/16"
    }

    resource "aws_subnet" "main" {
      vpc_id            = aws_vpc.main.id
      cidr_block        = "10.0.1.0/24"
      availability_zone = "${global.terraform.backend.region}a"

      tags = {
        Name = "${global.terraform.backend.region}a"
      }
    }

    output "subnet_id" {
      value = aws_subnet.main.id
    }
  }
}
