variable "project_name" {
  description = "Project identifier used for tagging and resource naming."
  type        = string
  default     = "c_car_platform"
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)."
  type        = string
  default     = "dev"
}

variable "aws_region" {
  description = "AWS region for provisioning (placeholder for now)."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Additional tags applied to all resources via provider default_tags."
  type        = map(string)
  default     = {}
}

variable "allowed_ingress_cidrs" {
  description = "CIDR allowlist placeholder for future security group ingress rules."
  type        = list(string)
  default     = ["127.0.0.1/32"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC (placeholder)."
  type        = string
  default     = "10.10.0.0/16"
}
