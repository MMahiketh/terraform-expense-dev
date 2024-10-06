output "mysql_sg_id" {
  value = module.mysql.id
}

output "backend_sg_id" {
  value = module.backend.id
}

output "frontend_sg_id" {
  value = module.frontend.id
}