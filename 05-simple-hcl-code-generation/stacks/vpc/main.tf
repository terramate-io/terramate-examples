// TERRAMATE: GENERATED AUTOMATICALLY DO NOT EDIT

module "vpc" {
  assign_generated_ipv6_cidr_block = true
  ipv4_primary_cidr_block          = "10.0.0.0/16"
  name                             = "app"
  namespace                        = "eg"
  source                           = "cloudposse/vpc/aws"
  stage                            = "test"
  version                          = "2.2.0"
}
