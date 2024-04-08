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