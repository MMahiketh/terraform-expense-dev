resource "aws_ssm_parameter" "vpc_id" {
  name  = "${local.ssm_prefix}/vpc/id"
  type  = "String"
  value = module.vpc.vpc_id
}