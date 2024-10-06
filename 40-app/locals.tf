locals {
  resource_name = "${var.project}-${var.environment}"
  ssm_prefix    = "/${var.project}/${var.environment}"

  network = ["public", "private", "database"]

  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }

  ami_id = data.aws_ami.join_devops_ami.id

  sg_ids = {
    mysql    = data.aws_ssm_parameter.mysql_sg_id.value,
    backend  = data.aws_ssm_parameter.backend_sg_id.value,
    frontend = data.aws_ssm_parameter.frontend_sg_id.value
  }

  subnet_ids = [
    split(",", data.aws_ssm_parameter.public_subnet_ids.value)[0],
    split(",", data.aws_ssm_parameter.private_subnet_ids.value)[0],
    split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
  ]
}