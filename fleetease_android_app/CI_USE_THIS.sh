#!/usr/bin/env bash
# Canonical CI entrypoint for Flutter mobile analysis from repository root.
# Use this file in CI instead of calling `flutter` directly at repo root.
set -euo pipefail
bash run_mobile_ci.sh
