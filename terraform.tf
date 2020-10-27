terraform {
  required_providers {
    artifactory = {
      source  = "jfrog/artifactory"
      version = "~> 2.2"
    }
  }
  required_version = "~> 0.13"
}

terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "onlydole"

    workspaces {
      name = "scaling-your-developers-talent"
    }
  }
}
