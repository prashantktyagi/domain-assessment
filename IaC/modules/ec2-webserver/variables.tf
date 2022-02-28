variable "vpc_id" {
    type = string
    description = "vpc ID for webserver ec2 machine"
}

variable "ami" {
  type = string
  description = "Amazone AMI ID present in the region."
}

variable "instance_type" {
  type = string
}

variable "iam_instance_profile" {
  type = string
}

variable "keypair_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "root_volume_size" {
  type = number
  default = 20
}

variable "tags" {
  default = {}
}