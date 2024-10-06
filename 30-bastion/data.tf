data "aws_ami" "az_linux" {
  owners = [ "137112412989" ]
  most_recent = true
  
  filter {
    name   = "name"
    values = ["al2023-ami-2023*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

data "aws_ssm_parameter" "bastion_sg_id" {
  name = "${local.ssm_prefix}/${var.instances[0]}/sg_id"
}

data "aws_ssm_parameter" "ansible_sg_id" {
  name = "${local.ssm_prefix}/${var.instances[1]}/sg_id"
}

data "aws_ssm_parameter" "public_subnet_ids" {
  name = "${local.ssm_prefix}/public/subnet/ids"
}