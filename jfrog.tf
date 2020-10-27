provider "artifactory" {
  url = "https://${var.jfrog_endpoint}/artifactory"
}

resource "artifactory_group" "operators" {
  name             = "operators"
  description      = "Administrative group for your users"
  admin_privileges = true
}

# resource "artifactory_user" "breakglass" {
#   name     = "Taylor Dolezal"
#   email    = "tdolezal@hashicorp.com"
#   groups   = ["reader", artifactory_group.operators.name]
#   password = "TooSecret2Share!"
# }

resource "artifactory_local_repository" "beacon" {
  key          = "beacon"
  package_type = "docker"
  description  = "A Docker image repository for the Beacon application"
  notes        = "The most advanced application you've ever seen"
  xray_index   = true
}
