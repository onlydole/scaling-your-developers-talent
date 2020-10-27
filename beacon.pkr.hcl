variable "beacon_tags" {
  type        = list(string)
  description = "Tags for the Beacon image"
  default     = ["latest"]
}

variable "jfrog_server" {
  type        = string
  description = "JFrog Server Endpoint"
}

variable "jfrog_username" {
  type        = string
  description = "Your JFrog username"
}

variable "jfrog_password" {
  type        = string
  description = "Your JFrog password"
}

source "docker" "nginx" {
  image  = "nginx:1.19-alpine"
  commit = true
}

build {
  sources = ["source.docker.nginx"]

  provisioner "file" {
    destination = "/usr/share/nginx/html/"
    source      = "./index.html"
  }

  provisioner "file" {
    destination = "/etc/nginx/conf.d/default.conf"
    source      = "./app.conf"
  }

  provisioner "file" {
    destination = "/etc/nginx/conf.d/status.conf"
    source      = "./status.conf"
  }

  post-processors {
    post-processor "docker-tag" {
      repository = "${var.jfrog_server}/beacon/web"
      tag        = var.beacon_tags
      force      = true
    }
    post-processor "docker-push" {
      login          = true
      login_server   = var.jfrog_server
      login_username = var.jfrog_username
      login_password = var.jfrog_password
    }
  }
}

