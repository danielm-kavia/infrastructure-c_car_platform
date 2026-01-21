# infrastructure-c_car_platform

Terraform infrastructure container (developer-first scaffolding).

This repository is intentionally **non-destructive by default** and **credential-free for CI** (fmt/validate).
Phase 2 adds a Terraform project structure with a **dev environment first** approach while avoiding any real cloud backends or credentials.

## Goals (Phase 2)
- Provide a consistent Terraform layout (`envs/dev`, `modules/*`) that can evolve into real provisioning later.
- Default to **local state** for dev to keep setup friction low.
- Include **guardrails** (confirmation prompts, tagging conventions, CIDR allowlist placeholders).
- Complement the platform preview system **without managing previews directly**.

## Prerequisites
- Terraform installed (version pinned via `.terraform-version`)
- No cloud credentials are required for:
  - `terraform fmt`
  - `terraform validate`
  - `terraform plan` against placeholder modules (no providers used beyond safe defaults)

## Repository Layout

- `envs/dev/` – Dev environment root module (composition layer)
  - `versions.tf` – Terraform version and required provider constraints
  - `providers.tf` – provider blocks (safe defaults)
  - `backend.tf` – **guarded** remote backend placeholder; local state by default
  - `main.tf` – wires module placeholders together
  - `variables.tf` – env-level variables (region, tags, allowlists)
  - `outputs.tf` – env-level outputs
  - `terraform.tfvars.example` – safe, non-secret example values
- `modules/*` – reusable modules (currently placeholders)
  - `network/`, `kafka/`, `postgres/`, `redis/`, `monitoring/`

## Local Dev Flow (Recommended)

From `infrastructure-c_car_platform/`:

1) Copy the example tfvars (no secrets included):
```bash
cp envs/dev/terraform.tfvars.example envs/dev/terraform.tfvars
```

2) Format & validate (safe, no credentials required):
```bash
make fmt
make validate ENV=dev
```

3) Plan (safe by default; uses local state unless you explicitly enable a remote backend):
```bash
make init ENV=dev
make plan ENV=dev
```

4) Apply / Destroy (guarded with confirmation prompt):
```bash
make apply ENV=dev
make destroy ENV=dev
```

### State handling
- **Default (dev):** local state file under `envs/dev/` directory.
- A remote backend stanza exists only as a **placeholder** and is **disabled by default**.
- If/when a remote backend is introduced, it should be enabled explicitly via `TF_ENABLE_REMOTE_STATE=1`
  and through provider/backend config updates.

## Relationship to Preview Environments
The platform’s preview lifecycle is managed elsewhere. This Terraform scaffolding:
- provides a consistent module and environment layout,
- documents how a future remote state and cloud provisioning could work,
- but does **not** create/update preview stacks or tie into preview automation at this phase.

## Security Guardrails (Minimal, Phase 2)
- `allowed_ingress_cidrs` variable exists for future security group rules (defaults to loopback-safe examples).
- Tagging is standardized via `tags` and `environment` variables for traceability.

## Commands

### Terraform directly
```bash
cd envs/dev
terraform fmt -recursive
terraform init -backend=false
terraform validate
terraform plan
```

### Makefile (recommended)
```bash
make fmt
make init ENV=dev
make validate ENV=dev
make plan ENV=dev
make apply ENV=dev
make destroy ENV=dev
```

> Note: This repo intentionally avoids running `terraform apply` in CI during early phases.
