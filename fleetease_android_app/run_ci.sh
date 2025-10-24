#!/usr/bin/env bash
set -euo pipefail
# Alias entry for CI systems to run from repo root
bash "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/ci_run_mobile.sh"
