# module: monitoring

Placeholder Terraform module for observability.

## Purpose
Defines future resources for logs/metrics (e.g., CloudWatch, OpenTelemetry collectors, dashboards).

## Inputs
- `name` (string): naming prefix
- `environment` (string): environment name
- `tags` (map(string)): additional tags

## Outputs
- `log_group_name` (string|null): placeholder
- `metrics_namespace` (string|null): placeholder

## Status
Phase 2 scaffolding only; no resources created.
