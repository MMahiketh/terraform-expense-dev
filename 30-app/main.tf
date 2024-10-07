# Create mysql, backend, frontend ec2 instances
module "mysql" {
  source = "terraform-aws-modules/ec2-instance/aws"

  ami  = local.ami_id
  name = "${local.resource_name}-${var.instances[0]}"

  instance_type          = var.instance_type
  vpc_security_group_ids = [local.sg_ids.mysql]
  subnet_id              = local.subnet_ids[2]

  tags = merge(
    local.common_tags,
    { Name = "${local.resource_name}-${var.instances[0]}" },
    var.mysql_tags
  )
}

module "backend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  ami  = local.ami_id
  name = "${local.resource_name}-${var.instances[1]}"

  instance_type          = var.instance_type
  vpc_security_group_ids = [local.sg_ids.backend]
  subnet_id              = local.subnet_ids[1]

  tags = merge(
    local.common_tags,
    { Name = "${local.resource_name}-${var.instances[1]}" },
    var.backend_tags
  )
}

module "frontend" {
  source = "terraform-aws-modules/ec2-instance/aws"

  ami  = local.ami_id
  name = "${local.resource_name}-${var.instances[2]}"

  instance_type          = var.instance_type
  vpc_security_group_ids = [local.sg_ids.frontend]
  subnet_id              = local.subnet_ids[0]

  tags = merge(
    local.common_tags,
    { Name = "${local.resource_name}-${var.instances[2]}" },
    var.frontend_tags
  )
}

# Route53 records
module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"

  zone_name = var.domain_name

  records = [
    {
      name            = var.instances[0]
      type            = "A"
      ttl             = 360
      allow_overwrite = true
      records         = [module.mysql.private_ip]
    },
    {
      name            = var.instances[1]
      type            = "A"
      ttl             = 360
      allow_overwrite = true
      records         = [module.backend.private_ip]
    },
    {
      name            = var.instances[2]
      type            = "A"
      ttl             = 360
      allow_overwrite = true
      records         = [module.frontend.private_ip]
    },
    {
      name            = ""
      type            = "A"
      ttl             = 360
      allow_overwrite = true
      records         = [module.frontend.public_ip]
    }
  ]
}
