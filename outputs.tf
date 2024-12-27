output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "web_sg_id" {
  description = "Web Security Group ID"
  value       = aws_security_group.web_sg.id
}

output "db_sg_id" {
  description = "Database Security Group ID"
  value       = aws_security_group.db_sg.id
}

output "alb_dns_name" {
  description = "DNS Name of the ALB"
  value       = aws_lb.app_alb.dns_name
}