data "terraform_remote_state" "tfe_infra" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}

# Create the payload json and make the API call to create the initial admin user
resource "restapi_object" "initial_admin" {
  provider     = restapi
  path         = "/admin/initial-admin-user?token=${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.iact_token}"
  id_attribute = "status"

  data = jsonencode({
    username = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_user}"
    email    = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_email}"
    password = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_password}"
  })

}
