variable "do_token" {
    description = "Digital Ocean API KEY"
    type = string
}

variable "vpc_name" {
    default = "lumba-lumba"
    description = "Digital Ocean VPC Name"
    type = string
}

variable "vpc_ip_range" {
    default = "10.10.10.0/24"
    description = "Digital Ocean VPC IP Range"
    type = string
}


variable "droplet_name" {
    default = "Hiu"
    description = "Digital Ocean Droplet Name"
    type = string
}

variable "droplet_size" {
    default = "s-1vcpu-1gb"
    description = "Digital Ocean Droplet Size"
    type = string
}


variable "droplet_image" {
    default = "ubuntu-20-04-x64"
    description = "Digital Ocean Droplet Size"
    type = string
}

variable "ssh_key_path" {
    default = ""
    description = "Digital Ocean SSH Public Key"
    type = string
}
