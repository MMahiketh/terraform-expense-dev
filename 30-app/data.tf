# Join devops practice AMI
data "aws_ami" "join_devops_ami" {
  owners      = ["973714476881"]
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

# Get security groups
data "aws_ssm_parameter" "mysql_sg_id" {
  name = "${local.ssm_prefix}/${var.instances[0]}/sg_id"
}

data "aws_ssm_parameter" "backend_sg_id" {
  name = "${local.ssm_prefix}/${var.instances[1]}/sg_id"
}

data "aws_ssm_parameter" "frontend_sg_id" {
  name = "${local.ssm_prefix}/${var.instances[2]}/sg_id"
}

# Get subnet IDs
data "aws_ssm_parameter" "public_subnet_ids" {
  name = "${local.ssm_prefix}/${local.network[0]}/subnet/ids"
}

data "aws_ssm_parameter" "private_subnet_ids" {
  name = "${local.ssm_prefix}/${local.network[1]}/subnet/ids"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "${local.ssm_prefix}/${local.network[2]}/subnet/ids"
}