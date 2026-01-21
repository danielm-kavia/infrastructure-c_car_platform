output "environment" {
  description = "The active environment name."
  value       = var.environment
}

output "network" {
  description = "Network module outputs."
  value       = module.network
}

output "kafka" {
  description = "Kafka module outputs."
  value       = module.kafka
}

output "postgres" {
  description = "Postgres module outputs."
  value       = module.postgres
}

output "redis" {
  description = "Redis module outputs."
  value       = module.redis
}

output "monitoring" {
  description = "Monitoring module outputs."
  value       = module.monitoring
}
