output "tfe_admin_user" {
  value = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_user
}

output "tfe_admin_password" {
  value = data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_admin_password
}

output "terraform_login" {
  value = "terraform login ${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname}"
}