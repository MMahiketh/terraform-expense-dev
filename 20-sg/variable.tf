variable "project" {
  default = "expense"
}

variable "environment" {
  default = "dev"
}

variable "vpc_id" {
  default = "vpc-004eaa275ecef58a0"
}

variable "instances" {
  default = ["mysql", "backend", "frontend"]
}