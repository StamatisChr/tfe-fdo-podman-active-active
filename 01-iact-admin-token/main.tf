module "wait_tfe_start" {
  source = "../modules/md02-wait-tfe-start"
}

module "create_initial_admin" {
  source = "../modules/md03-create-initial-admin"

  providers = {
    restapi = restapi
  }

  depends_on = [module.wait_tfe_start]
}

output "token" {
  value     = module.create_initial_admin.token
  sensitive = true
}

# Use local file resource to create the health check  bash script
resource "local_file" "create_tfe_org_ws_script" {
  filename = "./create_tfe_org_ws_script.sh"
  content  = <<-EOT
    #!/bin/bash
    cd ../02-tfe-org-ws
    terraform init
    terraform apply -auto-approve
  EOT

  depends_on = [module.create_initial_admin]
}

# Null resource to run the health check script 
resource "null_resource" "run_create_tfe_org_ws_script" {
  provisioner "local-exec" {
    command = "bash ${local_file.create_tfe_org_ws_script.filename}"
  }
  #  depends_on = [local_file.create_tfe_org_ws_script]
}

# Use local file resource to create the health check  bash script
resource "local_file" "create_clean_up_script" {
  filename = "../clean_up.sh"
  content  = <<-EOT
    #!/bin/bash
    cd ./01-iact-admin-token
    terraform destroy --auto-approve
    sleep 20
    rm -f terraform.tfstate
    rm -f terraform.tfstate.backup
    rm -f create_tfe_org_ws_script.sh
    rm -f tfe_health_check.sh

    cd ..
    rm -rf 03-example-cli-driven-ws

    terraform destroy --auto-approve
    sleep 10
    rm -f clean_up.sh
  EOT
}  