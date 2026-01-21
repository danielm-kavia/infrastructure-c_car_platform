# module: postgres

Placeholder Terraform module for PostgreSQL (fleet relational data).

## Purpose
Defines future provisioning for RDS Postgres (and/or TimescaleDB where applicable).

## Inputs
- `name` (string): naming prefix
- `environment` (string): environment name
- `tags` (map(string)): additional tags

## Outputs
- `endpoint` (string|null): placeholder
- `database_name` (string|null): placeholder

## Status
Phase 2 scaffolding only; no resources created.
