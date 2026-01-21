# module: network

Placeholder Terraform module for networking.

## Purpose
Defines the future interface for VPC/subnets/security boundaries used by the connected-car platform.

## Inputs
- `name` (string): naming prefix
- `vpc_cidr` (string): VPC CIDR
- `allowed_ingress_cidrs` (list(string)): placeholder allowlist for future security group rules
- `tags` (map(string)): additional tags

## Outputs
- `vpc_id` (string|null): placeholder
- `public_subnet_ids` (list(string)): placeholder
- `private_subnet_ids` (list(string)): placeholder

## Status
Phase 2 scaffolding: does not create resources yet. Safe for `terraform validate` without credentials.
