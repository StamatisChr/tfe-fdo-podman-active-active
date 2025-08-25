variable "tfe_license" {
  description = "your TFE license string"
  type        = string
}

variable "aws_region" {
  description = "The AWS region in use to spawn the resources"
  type        = string
  default     = "eu-west-1"
}

variable "tfe_instance_class" {
  description = "The ec2 instance type for TFE"
  type        = string
  default     = "t3.xlarge"
}

variable "db_instance_class" {
  description = "The rds instance class for TFE"
  type        = string
  default     = "db.t3.large"
}

variable "redis_node_type" {
  description = "The instance type for the Redis nodes"
  type        = string
  default     = "cache.t3.medium"
}

variable "hosted_zone_name" {
  description = "The zone ID of my doormat hosted route53 zone"
  type        = string
}

variable "tfe_http_port" {
  description = "TFE container http port"
  type        = number
  default     = 8080
}

variable "tfe_https_port" {
  description = "TFE container https port"
  type        = number
  default     = 8443
}

variable "tfe_encryption_password" {
  description = "TFE encryption password"
  type        = string
  default     = "Password1#"
}

variable "tfe_host_path_to_certificates" {
  description = "The path on the host machine to store the certificate files"
  type        = string
  default     = "/etc/terraform-enterprise/certs"
}

variable "lets_encrypt_cert" {
  description = "value"
  type        = string
  default     = "fullchain.pem"

}

variable "lets_encrypt_key" {
  description = "value"
  type        = string
  default     = "privkey.pem"
}

variable "tfe_database_user" {
  description = "The user of the database in the RDS instance"
  type        = string
  default     = "tfeadmin"
}

variable "tfe_database_name" {
  description = "The database name in the RDS instance"
  type        = string
  default     = "terraform"
}

variable "tfe_database_password" {
  description = "The database password of the database name in the RDS instance"
  type        = string
  default     = "Password1#"
}

variable "tfe_admin_user" {
  description = "The admin user for the TFE instance"
  type        = string
  default     = "admin"
}

variable "tfe_admin_password" {
  description = "The password for the TFE admin user"
  type        = string
  default     = "Password1#"
}

variable "tfe_admin_email" {
  description = "The email for the TFE admin user"
  type        = string
  default     = "example@example.com"
}

variable "tfe_org_name" {
  description = "The name of the TFE organization"
  type        = string
  default     = "example-org"
}

variable "tfe_workspace_name" {
  description = "The name of the TFE workspace"
  type        = string
  default     = "example-workspace"
}

variable "token" {
  default = "tobereplaced"
}