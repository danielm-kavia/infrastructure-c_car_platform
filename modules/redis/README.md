# module: redis

Placeholder Terraform module for Redis (session/cache).

## Purpose
Defines a future interface for ElastiCache Redis (cloud) and parity with local docker-compose Redis.

## Inputs
- `name` (string): naming prefix
- `environment` (string): environment name
- `tags` (map(string)): additional tags

## Outputs
- `endpoint` (string|null): placeholder

## Status
Phase 2 scaffolding only; no resources created.
