# Capture the admin user token from the API response, this works once and only if the user is created successfully
output "token" {
  value     = try(jsondecode(restapi_object.initial_admin.api_response).token, "user token can be generated once")
  sensitive = true
}