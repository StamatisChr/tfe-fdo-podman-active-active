data "terraform_remote_state" "tfe_infra" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}

terraform {
  required_providers {
    restapi = {
      source  = "Mastercard/restapi"
      version = "~> 1.18"
    }
  }
}

provider "restapi" {
  uri                  = "https://${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname}"
  write_returns_object = true

  headers = {
    Content-Type = "application/json"
  }
}
