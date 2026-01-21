# Dev environment root module.
# Intentionally placeholder-only in Phase 2: it demonstrates composition and interfaces
# without provisioning real cloud resources yet.

module "network" {
  source = "../../modules/network"

  name                  = "${var.project_name}-${var.environment}"
  vpc_cidr              = var.vpc_cidr
  allowed_ingress_cidrs = var.allowed_ingress_cidrs
  tags                  = var.tags
}

module "kafka" {
  source = "../../modules/kafka"

  name        = "${var.project_name}-${var.environment}"
  environment = var.environment
  tags        = var.tags
}

module "postgres" {
  source = "../../modules/postgres"

  name        = "${var.project_name}-${var.environment}"
  environment = var.environment
  tags        = var.tags
}

module "redis" {
  source = "../../modules/redis"

  name        = "${var.project_name}-${var.environment}"
  environment = var.environment
  tags        = var.tags
}

module "monitoring" {
  source = "../../modules/monitoring"

  name        = "${var.project_name}-${var.environment}"
  environment = var.environment
  tags        = var.tags
}
