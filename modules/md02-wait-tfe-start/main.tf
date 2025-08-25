data "terraform_remote_state" "tfe_infra" {
  backend = "local"
  config = {
    path = "../terraform.tfstate"
  }
}

# Use local file resource to create the health check  bash script
resource "local_file" "check_check_script" {
  filename = "./tfe_health_check.sh"
  content  = <<-EOT
    #!/bin/bash

    echo "Waiting for TFE at https://${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname} to be ready..."

    while [ "$(curl -fsS "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname}/_health_check" )" != "OK" ]; do
      echo "$(date +"%Y-%m-%d %H:%M:%S") Waiting TFE to start..."
      sleep 30
    done
      
    echo "$(date +"%Y-%m-%d %H:%M:%S") TFE is ready!"
  EOT
}

# Null resource to run the health check script 
resource "null_resource" "run_script" {
  provisioner "local-exec" {
    command = "bash ${local_file.check_check_script.filename}"
  }
}

# Create terraform configuration file for the remote execution example on TFE
resource "local_file" "example_tf_file" {
  filename = "../03-example-cli-driven-ws/main.tf"
  content  = <<-EOT
        terraform {
          cloud {
            hostname     = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_hostname}"
            organization = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_org_name}"
            workspaces {
              name = "${data.terraform_remote_state.tfe_infra.outputs.tfe_infra.tfe_workspace_name}"
            }
          }  
        }

        module "null_resources" {
            source = "git::https://github.com/StamatisChr/mynull.git"
        }
    EOT
}

