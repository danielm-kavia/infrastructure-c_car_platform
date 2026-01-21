variable "name" {
  description = "Base name/prefix for network resources."
  type        = string
}

variable "vpc_cidr" {
  description = "VPC CIDR block (placeholder)."
  type        = string
}

variable "allowed_ingress_cidrs" {
  description = "CIDR allowlist placeholder for ingress rules."
  type        = list(string)
  default     = ["127.0.0.1/32"]
}

variable "tags" {
  description = "Additional tags passed from environment."
  type        = map(string)
  default     = {}
}
