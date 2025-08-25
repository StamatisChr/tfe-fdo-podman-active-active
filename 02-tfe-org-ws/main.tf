module "tfe_org" {
  source = "../modules/md04-tfe-org-ws"
}

output "tfe_info" {
  value = module.tfe_org
}