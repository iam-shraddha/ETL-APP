############################
# OUTPUTS FOR VPC COMPONENTS
############################

output "vpc_id" {
  value       = aws_vpc.this.id
  description = "ID of the VPC"
}

output "public_subnet_ids" {
  value       = [for s in aws_subnet.public : s.id]
  description = "List of public subnet IDs"
}

output "private_subnet_ids" {
  value       = [for s in aws_subnet.private : s.id]
  description = "List of private subnet IDs"
}

output "internet_gateway_id" {
  value       = aws_internet_gateway.igw.id
  description = "Internet Gateway ID"
}

output "public_route_table_id" {
  value       = aws_route_table.public.id
  description = "Public Route Table ID"
}

output "private_route_table_ids" {
  value       = [for rt in aws_route_table.private : rt.id]
  description = "List of Private Route Table IDs"
}

output "core_sg_id" {
  value       = aws_security_group.core_sg.id
  description = "Core Security Group ID"
}

output "orch_sg_id" {
  value       = aws_security_group.orch_sg.id
  description = "Orchestrator Security Group ID"
}

output "pg_sg_id" {
  value       = aws_security_group.pg_sg.id
  description = "PostgreSQL Security Group ID"
}

