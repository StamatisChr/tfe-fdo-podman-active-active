variable "aws_region" {
  description = "The AWS region in use to spawn the resources"
  type        = string
}

variable "db_instance_class" {
  description = "The rds instance class for TFE"
  type        = string
}

variable "hosted_zone_name" {
  description = "The zone ID of my doormat hosted route53 zone"
  type        = string
}

variable "lets_encrypt_cert" {
  description = "value"
  type        = string
}

variable "lets_encrypt_key" {
  description = "value"
  type        = string
}

variable "redis_node_type" {
  description = "The instance type for the Redis nodes"
  type        = string
}

variable "tfe_admin_email" {
  description = "The email for the TFE admin user"
  type        = string
}

variable "tfe_admin_password" {
  description = "The password for the TFE admin user"
  type        = string
}

variable "tfe_admin_user" {
  description = "The admin user for the TFE instance"
  type        = string
}

variable "tfe_database_name" {
  description = "The database name in the RDS instance"
  type        = string
}

variable "tfe_database_password" {
  description = "The database password of the database name in the RDS instance"
  type        = string
}

variable "tfe_database_user" {
  description = "The user of the database in the RDS instance"
  type        = string
}

variable "tfe_encryption_password" {
  description = "TFE encryption password"
  type        = string
}

variable "tfe_host_path_to_certificates" {
  description = "The path on the host machine to store the certificate files"
  type        = string
}

variable "tfe_http_port" {
  description = "TFE container http port"
  type        = number
}

variable "tfe_https_port" {
  description = "TFE container https port"
  type        = number
}

variable "tfe_instance_class" {
  description = "The ec2 instance type for TFE"
  type        = string
}

variable "tfe_license" {
  description = "your TFE license string"
  type        = string
}

variable "tfe_org_name" {
  description = "The name of the TFE organization"
  type        = string
}

variable "tfe_version_image" {
  description = "The TFE version image"
  type        = string
}

variable "tfe_workspace_name" {
  description = "The name of the TFE workspace"
  type        = string
}
