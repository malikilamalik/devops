resource "digitalocean_vpc" "terraform-do-exercise" {
    name     = "${var.vpc_name}-${local.vpc_name_prefix}"
    region   = "${local.vpc_region}"
    ip_range = var.vpc_ip_range
}