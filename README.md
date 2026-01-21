# infrastructure-c_car_platform

Terraform infrastructure container (placeholder).

## Prerequisites
- Terraform installed (use `hashicorp/setup-terraform` in CI)
- Cloud credentials are **not** required for `terraform fmt` and `terraform validate` on modules that don't fetch remote state.

## Commands

```bash
terraform fmt -recursive
terraform init -backend=false
terraform validate
```

> Note: This repo intentionally avoids running `terraform plan/apply` in CI during Phase 0.
