variable "project" {
  type    = string
  default = "expense"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "instances" {
  type    = list(string)
  default = ["mysql", "backend", "frontend"]
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

# Tags
variable "mysql_tags" {
  type    = map(any)
  default = {}
}

variable "backend_tags" {
  type    = map(any)
  default = {}
}

variable "frontend_tags" {
  type    = map(any)
  default = {}
}

variable "domain_name" {
  type = string
  default = "mahdo.site"
}