generate_hcl "ec2.tf" {
  stack_filter {
    project_paths = [
      "ec2/*"
    ]
  }

  content {
    resource "aws_instance" "web" {
      instance_type = "t3.micro"
      ami           = data.aws_ami.ubuntu.id

      subnet_id = data.aws_subnet.subnet.id
      # subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id

      tags = {
        Name = terramate.stack.path.basename
      }
    }

    # data "terraform_remote_state" "vpc" {
    #   backend = "s3"
    #   config = {
    #     bucket  = global.terraform.backend.bucket
    #     region  = global.terraform.backend.region
    #     encrypt = true
    #     # The key here uses the stack ID of the VPC stack
    #     key = "terraform/stacks/by-id/fedcfb3-ce64-4ba2-bc1e-1ab22bceba35/terraform.tfstate"
    #   }

    #   depends_on = [
    #     null_resource.initial_deployment_trigger
    #   ]
    # }

    data "aws_subnet" "subnet" {
      filter {
        name   = "tag:Name"
        values = ["${global.terraform.backend.region}a"]
      }

      depends_on = [
        null_resource.initial_deployment_trigger
      ]
    }


    resource "null_resource" "initial_deployment_trigger" {
    }


    data "aws_ami" "ubuntu" {
      most_recent = true

      filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
      }

      filter {
        name   = "virtualization-type"
        values = ["hvm"]
      }

      owners = ["099720109477"] # Canonical
    }
  }
}
