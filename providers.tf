provider "aviatrix" {
  username      = "admin"
  password      = var.ctrl_password
  controller_ip = var.ctrl_ip
  version = "2.18.2"
}
