variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "mysql_port" {
  default = 3306
}

variable "api_port" {
  default = 8080
}

variable "http_port" {
  default = 80
}

variable "protocol" {
  default = "tcp"
}