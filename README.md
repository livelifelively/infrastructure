# Terraform

## Commands

1. `terraform fmt` - Reformat your configuration in the standard style.
2. `terraform init` - Prepare your working directory for other commands
3. `terraform validate` - Check whether the configuration is valid
4. `terraform plan` - Show changes required by the current configuration
5. `terraform apply` - Create or update infrastructure, can add `-auto-approve` flag to not having to confirm changes.
6. `terraform destroy` - Destroy previously-created infrastructure, can add `-auto-approve` flag to not having to confirm changes.

## Remote state

terraform state needs to stored remotely in aws s3. To do that,

1. we are creating s3 and dynamodb for different  for all projects.
2. these backend configs will be then passed to respective terraform repos
3. the main creates a state remote for all projects.

## Create genesis state from the main folder

first just create the infrastructure, that is, `module "tf-state"` using `terraform init` and then `terraform apply`. 

the main's state can be commited to github. not to be shared with others. keeping state in remote s3 bucket and dynamodb still has a possibility being deleted accidently.

If in future we want to store state for this one also in remote s3, add `backend "s3" {}` to backend. add backend.hcl file. run `yarn tf-init`, which will use `backend.hcl` configs. you will given option to send local state to remote, do make sure to send it.

for the rest of modules, just create the infrastructure using `terraform init` and then `terraform apply`. use names and region used to generate s3 bucket and dynamodb table in corresponding project's `terraform.tfvars` and `backend.hcl` files.

ALSO, notice that the s3 backend can be in a different region from the infrastructure. backend.hcl has required argument for region. so lets keep the main and all the project tf files in one region only.

## DO NOT DESTROY the main

the main refers to all the other files, do not delete it, like ever.

## project admins

I can also create admin user profiles from here for different projects. #TODO
