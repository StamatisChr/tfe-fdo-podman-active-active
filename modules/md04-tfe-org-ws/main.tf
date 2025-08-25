#  Use terraform_remote_state data source to fetch outputs from the TFE infrastructure
data "terraform_remote_state" "tfe_infra" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}


#  Use terraform_remote_state data source to fetch the admin token from the initial admin creation output
data "terraform_remote_state" "iact-admin-token" {
  backend = "local"
  config = {
    path = "../01-iact-admin-token/terraform.tfstate"
  }
}


# Configure TFE provider
provider "tfe" {
  hostname = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname
  token    = data.terraform_remote_state.iact-admin-token.outputs.token
}

# Create TFE organization
resource "tfe_organization" "test-org" {
  name  = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_org_name
  email = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_email
}

# Create TFE workspace
resource "tfe_workspace" "test" {
  name         = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_workspace_name
  organization = tfe_organization.test-org.name
}

