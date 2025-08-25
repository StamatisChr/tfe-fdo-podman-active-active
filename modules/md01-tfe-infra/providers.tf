terraform {
  required_providers {
    acme = {
      source                = "vancluever/acme"
      configuration_aliases = [acme]
    }
  }
}
