SHELL := /bin/bash

# Default environment
ENV ?= dev

# Environment directory root module
TF_ENV_DIR := envs/$(ENV)

# Default flags:
# -lock=false keeps local/dev friction low and avoids lock contention in shared CI runners.
TF_LOCK ?= false
TF_LOCK_FLAG := -lock=$(TF_LOCK)

# Terraform binary (override if needed)
TERRAFORM ?= terraform

# ===== Helpers =====
.PHONY: help
help:
	@echo "Terraform (dev-first) helper commands"
	@echo ""
	@echo "Usage:"
	@echo "  make <target> ENV=dev"
	@echo ""
	@echo "Targets:"
	@echo "  fmt                 - terraform fmt -recursive"
	@echo "  init                - terraform init (local state by default; backend disabled)"
	@echo "  validate            - terraform validate"
	@echo "  plan                - terraform plan"
	@echo "  apply               - terraform apply (requires confirmation)"
	@echo "  destroy             - terraform destroy (requires confirmation)"
	@echo "  precommit           - run fmt + validate for ENV"
	@echo ""
	@echo "Environment:"
	@echo "  ENV=dev             - selects env folder under envs/"
	@echo ""
	@echo "Remote state placeholder:"
	@echo "  TF_ENABLE_REMOTE_STATE=1 enables backend (if configured later)."
	@echo ""
	@echo "Examples:"
	@echo "  make init ENV=dev"
	@echo "  make plan ENV=dev"
	@echo "  make apply ENV=dev"

# INTERNAL: guard to prevent accidental destructive actions
define confirm
	@echo ""
	@echo "WARNING: You are about to run a potentially destructive Terraform action in: $(TF_ENV_DIR)"
	@echo "Type '$(1)' to continue:"
	@read -r input; \
	if [[ "$$input" != "$(1)" ]]; then \
		echo "Aborted."; \
		exit 1; \
	fi
endef

# ===== Targets =====
.PHONY: fmt
fmt:
	@$(TERRAFORM) fmt -recursive

.PHONY: init
init:
	@if [[ ! -d "$(TF_ENV_DIR)" ]]; then echo "Env folder not found: $(TF_ENV_DIR)"; exit 1; fi
	@cd "$(TF_ENV_DIR)" && \
	if [[ "$${TF_ENABLE_REMOTE_STATE:-0}" == "1" ]]; then \
		echo "TF_ENABLE_REMOTE_STATE=1 (remote backend may be used if backend.tf is configured)."; \
		$(TERRAFORM) init; \
	else \
		echo "Using local state (backend disabled). Set TF_ENABLE_REMOTE_STATE=1 to enable remote backend later."; \
		$(TERRAFORM) init -backend=false; \
	fi

.PHONY: validate
validate:
	@if [[ ! -d "$(TF_ENV_DIR)" ]]; then echo "Env folder not found: $(TF_ENV_DIR)"; exit 1; fi
	@cd "$(TF_ENV_DIR)" && $(TERRAFORM) validate

.PHONY: plan
plan:
	@if [[ ! -d "$(TF_ENV_DIR)" ]]; then echo "Env folder not found: $(TF_ENV_DIR)"; exit 1; fi
	@cd "$(TF_ENV_DIR)" && $(TERRAFORM) plan $(TF_LOCK_FLAG)

.PHONY: apply
apply:
	@if [[ ! -d "$(TF_ENV_DIR)" ]]; then echo "Env folder not found: $(TF_ENV_DIR)"; exit 1; fi
	$(call confirm,apply)
	@cd "$(TF_ENV_DIR)" && $(TERRAFORM) apply $(TF_LOCK_FLAG)

.PHONY: destroy
destroy:
	@if [[ ! -d "$(TF_ENV_DIR)" ]]; then echo "Env folder not found: $(TF_ENV_DIR)"; exit 1; fi
	$(call confirm,destroy)
	@cd "$(TF_ENV_DIR)" && $(TERRAFORM) destroy $(TF_LOCK_FLAG)

.PHONY: precommit
precommit: fmt init validate
	@echo "precommit checks passed for ENV=$(ENV)"
