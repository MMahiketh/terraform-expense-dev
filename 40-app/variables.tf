variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "instance_type" {
  default = "t3.micro"
}

variable "mysql_tags" {
  type = map(any)
  default = {}
}

variable "backend_tags" {
  type = map(any)
  default = {}
}

variable "frontend_tags" {
  type = map(any)
  default = {}
}