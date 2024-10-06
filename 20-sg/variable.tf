variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "vpc_id" {
  default = "vpc-004eaa275ecef58a0"
}

variable "instance" {
  default = ["mysql", "backend", "frontend"]
}