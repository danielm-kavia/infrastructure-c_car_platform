variable "name" {
  description = "Base name/prefix for Kafka resources."
  type        = string
}

variable "environment" {
  description = "Environment name (dev/staging/prod)."
  type        = string
}

variable "tags" {
  description = "Additional tags passed from environment."
  type        = map(string)
  default     = {}
}
