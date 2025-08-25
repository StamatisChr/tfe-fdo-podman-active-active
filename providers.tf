terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.6"
    }

    acme = {
      source  = "vancluever/acme"
      version = "~> 2.0"
    }

    cloudinit = {
      source  = "hashicorp/cloudinit"
      version = "~> 2.0"
    }

    restapi = {
      source  = "Mastercard/restapi"
      version = "~> 1.18"
    }
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.37"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# Configure the ACME Provider
provider "acme" {
  server_url = "https://acme-v02.api.letsencrypt.org/directory"
}
