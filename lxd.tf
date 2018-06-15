variable "address" {}

variable "password" {}

provider "lxd" {
  accept_remote_certificate = true

  lxd_remote {
    name     = "nasu-homeserver-01"
    address  = "${var.address}"
    password = "${var.password}"
    scheme   = "https"
    default  = true
  }
}

resource "lxd_container" "terra-test01" {
  name      = "terra-test01"
  image     = "centos7"
  ephemeral = false
}
