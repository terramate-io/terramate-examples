# Example of sharing data between stacks with Terramate

This example shows dynamic generation of the Terraform backend allowing us to use a `terraform_remote_state` data block that references a different stack by ID. Combined with using tags for ordering, this means we can easily reorganise our stacks without any breakage.

To try this example you will need to edit the file `backend.tm.hcl` and change the bucket name to an existing bucket you have access to.
