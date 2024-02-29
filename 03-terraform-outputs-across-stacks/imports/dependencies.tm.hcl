#
# Generate dependency data sources
#

#
# The dependency logic depends on two global maps to set dependencies and it also reuses the
# terraform backend configuration.
#
# global.available_dependencies - Available dependencies
# -------------------------------------------------------
#
#    To make a stack available as a dependency we need to set an identifier to the actual stack.id
#    this identifier can then be used in stacks where this Terramate Global is inherited to to trigger
#    code generation of a remote state data source. Example:
#
#      global "available_dependencies" {
#        identifier = "{stack.id}"
#      }
#
# global.dependencies - Enabled dependencies
# ------------------------------------------
#
#    To trigger code generation of remote state data sources for ALL enabled dependencies
#    the identifier of the dependency needs to be enabled by setting the value to `true`.
#    Any not set value will be interpreted as `false`. Example:
#
#      global "dependencies" {
#        identifier = true
#      }
#
#    As globals will be inherited, all nested stacks or stacks reachable from the configuration
#    will genearte the data source code. To disable this unset the identifier or set it to false.
#    Example:
#
#      global "dependencies" {
#        identifier-a = unset
#        identifier-b = false
#      }
#
# global.terraform.backend.s3 - Terraform backend configuration
# -------------------------------------------------------------
#
#   This global map is required to exist and configure the `bucket` and `region` values.
#
#   For details see backend.tm.hcl
#
generate_hcl "_terramate_generated_dependencies.tf" {
  condition = tm_length(tm_try(global.dependencies, [])) > 0

  lets {
    dependencies           = tm_try(global.dependencies, {})
    available_dependencies = tm_try(global.available_dependencies, {})
    unknown_dependencies   = tm_setsubtract(tm_keys(let.dependencies), tm_keys(let.available_dependencies))

    active_dependencies = [
      for k, v in tm_try(global.dependencies, {}) : k if v
    ]
  }

  content {
    tm_dynamic "data" {
      for_each = let.active_dependencies
      labels   = ["terraform_remote_state", remote.value]
      iterator = remote

      content {
        backend = "s3"
        config = {
          bucket  = global.terraform.backend.s3.bucket
          key     = "terraform/states/by-id/${global.available_dependencies[remote.value]}/terraform.state"
          region  = global.terraform.backend.s3.region
          encrypt = true
        }

        depends_on = [
          null_resource.initial_deployment_trigger
        ]
      }
    }

    resource "null_resource" "initial_deployment_trigger" {}
  }

  # improve UX by defining better error messages in case required configuration is missing

  assert {
    assertion = tm_length(let.unknown_dependencies) == 0
    message   = "Unknown dependencies required: ${tm_join(",", let.unknown_dependencies)}"
  }

  assert {
    assertion = tm_length(tm_try(global.terraform.backend.s3.bucket, "")) > 0
    message   = "Terramate Global Variable terraform.backend.s3.bucket is required, but not set"
  }

  assert {
    assertion = tm_length(tm_try(global.terraform.backend.s3.region, "")) > 0
    message   = "Terramate Global Variable terraform.backend.s3.region is required, but not set"
  }
}
