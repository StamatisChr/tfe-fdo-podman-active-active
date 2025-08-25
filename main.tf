module "tfe_infra" {
  source = "./modules/md01-tfe-infra"

  providers = {
    acme = acme
  }

  aws_region                     = var.aws_region
  db_instance_class              = var.db_instance_class
  hosted_zone_name               = var.hosted_zone_name
  lets_encrypt_cert              = var.lets_encrypt_cert
  lets_encrypt_key               = var.lets_encrypt_key
  redis_node_type                = var.redis_node_type
  tfe_admin_email                = var.tfe_admin_email
  tfe_admin_password             = var.tfe_admin_password
  tfe_admin_user                 = var.tfe_admin_user
  tfe_database_name              = var.tfe_database_name
  tfe_database_password          = var.tfe_database_password
  tfe_database_user              = var.tfe_database_user
  tfe_encryption_password        = var.tfe_encryption_password
  tfe_host_path_to_certificates  = var.tfe_host_path_to_certificates
  tfe_http_port                  = var.tfe_http_port
  tfe_https_port                 = var.tfe_https_port
  tfe_instance_class             = var.tfe_instance_class
  tfe_license                    = var.tfe_license
  tfe_org_name                   = var.tfe_org_name
  tfe_version_image              = var.tfe_version_image
  tfe_workspace_name             = var.tfe_workspace_name
}


output "tfe_infra" {
  value     = module.tfe_infra
  sensitive = true
}
