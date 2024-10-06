variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  default = ["ansible", "bastion"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "ansible_tags" {
  type = map(any)
  default = {}
}

variable "bastion_tags" {
  type = map(any)
  default = {}
}