variable "name" {
  description = "Base name/prefix for Redis resources."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
}

variable "tags" {
  description = "Additional tags passed from environment."
  type        = map(string)
  default     = {}
}
