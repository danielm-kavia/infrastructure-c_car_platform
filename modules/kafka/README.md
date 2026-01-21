# module: kafka

Placeholder Terraform module for Kafka / streaming backbone.

## Purpose
Defines a future interface for provisioning Kafka infrastructure (e.g., AWS MSK in cloud, docker-compose locally).

## Inputs
- `name` (string): naming prefix
- `environment` (string): environment name
- `tags` (map(string)): additional tags

## Outputs
- `bootstrap_brokers` (list(string)): placeholder
- `cluster_arn` (string|null): placeholder

## Status
Phase 2 scaffolding: no resources created yet.
