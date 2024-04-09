output "ip_private" {
  value = digitalocean_droplet.terraform_do_exercise_droplet.ipv4_address_private
}

output "ip_public" {
  value = digitalocean_droplet.terraform_do_exercise_droplet.ipv4_address
}