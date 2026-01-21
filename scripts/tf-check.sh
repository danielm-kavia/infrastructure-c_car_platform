#!/usr/bin/env bash
set -euo pipefail

ENV="${1:-dev}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_DIR="${ROOT_DIR}/envs/${ENV}"

if [[ ! -d "${ENV_DIR}" ]]; then
  echo "Env directory not found: ${ENV_DIR}" >&2
  exit 1
fi

echo "[tf-check] Running terraform fmt..."
terraform fmt -recursive "${ROOT_DIR}"

echo "[tf-check] Running terraform init (backend disabled / local state)..."
pushd "${ENV_DIR}" >/dev/null
terraform init -backend=false >/dev/null
echo "[tf-check] Running terraform validate..."
terraform validate
popd >/dev/null

echo "[tf-check] OK (ENV=${ENV})"
