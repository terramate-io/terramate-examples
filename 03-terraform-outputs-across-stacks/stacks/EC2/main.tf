# Terraform >= 0.12
resource "aws_instance" "main" {
  # ...
  subnet_id = data.terraform_remote_state.vpc.outputs.subnet_id
}