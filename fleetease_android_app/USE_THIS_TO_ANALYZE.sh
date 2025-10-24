#!/usr/bin/env bash
set -euo pipefail
# Canonical analyzer entrypoint for CI. Do not run `flutter` from repo root.
bash run_app_analyze.sh
