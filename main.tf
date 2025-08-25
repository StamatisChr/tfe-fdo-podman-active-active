variable "tfe_version_image" {
  default = "v202507-1"
}

module "tfe_infra" {
  source = "./modules/md01-tfe-infra"

  providers = {
    acme = acme
  }

  tfe_version_image             = var.tfe_version_image
  aws_region                    = var.aws_region
  hosted_zone_name              = var.hosted_zone_name
  tfe_license                   = var.tfe_license
  tfe_instance_class            = var.tfe_instance_class
  db_instance_class             = var.db_instance_class
  redis_node_type               = var.redis_node_type
  tfe_http_port                 = var.tfe_http_port
  tfe_https_port                = var.tfe_https_port
  tfe_encryption_password       = var.tfe_encryption_password
  tfe_host_path_to_certificates = var.tfe_host_path_to_certificates
  lets_encrypt_cert             = var.lets_encrypt_cert
  lets_encrypt_key              = var.lets_encrypt_key
  tfe_database_user             = var.tfe_database_user
  tfe_database_name             = var.tfe_database_name
  tfe_database_password         = var.tfe_database_password
  tfe_admin_user                = var.tfe_admin_user
  tfe_admin_password            = var.tfe_admin_password
  tfe_admin_email               = var.tfe_admin_email
  tfe_org_name                  = var.tfe_org_name
  tfe_workspace_name            = var.tfe_workspace_name
}


output "tfe_infra" {
  value     = module.tfe_infra
  sensitive = true
}
