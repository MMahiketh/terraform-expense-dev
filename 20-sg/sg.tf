module "mysql" {
  source = "git::https://github.com/MMahiketh/terraform-sg-module.git?ref=master"

  project = var.project
  environment = var.environment
  instance = var.instance[0]
  vpc_id = var.vpc_id
}

module "backend" {
  source = "git::https://github.com/MMahiketh/terraform-sg-module.git?ref=master"

  project = var.project
  environment = var.environment
  instance = var.instance[1]
  vpc_id = var.vpc_id
}

module "frontend" {
  source = "git::https://github.com/MMahiketh/terraform-sg-module.git?ref=master"

  project = var.project
  environment = var.environment
  instance = var.instance[2]
  vpc_id = var.vpc_id
}