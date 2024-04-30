// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id     = data.aws_subnet.subnet.id
  tags = {
    Name = "instance-b"
  }
}
data "aws_subnet" "subnet" {
  depends_on = [
    null_resource.initial_deployment_trigger,
  ]
  filter {
    name = "tag:Name"
    values = [
      "us-east-1a",
    ]
  }
}
resource "null_resource" "initial_deployment_trigger" {
}
data "aws_ami" "ubuntu" {
  most_recent = true
  owners = [
    "099720109477",
  ]
  filter {
    name = "name"
    values = [
      "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*",
    ]
  }
  filter {
    name = "virtualization-type"
    values = [
      "hvm",
    ]
  }
}
