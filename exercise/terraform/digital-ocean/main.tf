resource "digitalocean_vpc" "terraform-do-exercise" {
    name     = "${var.vpc_name}-${local.vpc_name_prefix}"
    region   = "${local.vpc_region}"
    ip_range = var.vpc_ip_range
}

resource "digitalocean_ssh_key" "default" {
    name = "Malik"
    public_key = file("${var.ssh_key_path}")
}


resource "digitalocean_droplet" "terraform_do_exercise_droplet" {
  image  = "${var.droplet_image}"
  name   = "${var.droplet_name}-${local.droplet_name_prefix}"
  region = "${local.droplet_region}"
  size   = var.droplet_size
  ssh_keys = [digitalocean_ssh_key.default.fingerprint]
}

resource "digitalocean_firewall" "web" {
  name = "only-22-80-and-443"

  droplet_ids = [digitalocean_droplet.terraform_do_exercise_droplet.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "443"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "tcp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "udp"
    port_range            = "53"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol              = "icmp"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}
