```sh

# TODO add docs for Terramate Cloud configuration

# Init Terraform
terramate run -C 06-workspaces-with-targets -- terraform init

# List all available Terraform workspaces (per default there is only one workspace called 'default')
terramate run -C 06-workspaces-with-targets -- terraform workspace list

# current workspace ('default') worksapces always exists
terramate run -C 06-workspaces-with-targets -- terraform workspace show

# Sync the 'default' workspace as the 'default' target to Terramate Cloud
terramate run \
  -X \
  -C 06-workspaces-with-targets \
  --sync-drift-status \
  --terraform-plan-file plan.tfplan \
  -- \
  terraform plan -out plan.tfplan -detailed-exitcode

# create new workspace 'prod', we don't need to run `terraform init` again as dependencies are reused
terramate run \
  -C 06-workspaces-with-targets \
  -- \
  terraform workspace new prod 

# sync the workspace as the 'prd' target
terramate run \
  -X \
  -C 06-workspaces-with-targets \
  --sync-drift-status \
  --terraform-plan-file plan.tfplan \
  --target prd \
  -- \
  terraform plan -out plan.tfplan -detailed-exitcode
  
# select the default workspace again
terramate run -- terraform workspace select default

# sync the default workpace but rename the deployment target from 'default' to 'dev' in Terramate Cloud
terramate run \
  -X \
  -C 06-workspaces-with-targets \
  --sync-drift-status \
  --terraform-plan-file plan.tfplan \
  --from-target default \
  --target dev \
  -- \
  terraform plan -out plan.tfplan -detailed-exitcode
```
