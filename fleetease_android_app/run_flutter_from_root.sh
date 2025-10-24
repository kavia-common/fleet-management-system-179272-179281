#!/usr/bin/env bash
set -euo pipefail

# This script is intended for CI systems that only execute a single script at repo root.
# It forwards to the flutter wrapper which always changes into the app directory.

if [ ! -f "./flutterw" ]; then
  echo "[run_flutter_from_root] ERROR: flutterw not found at repository root." >&2
  exit 1
fi

./flutterw pub get
./flutterw analyze
CI=true ./flutterw test -r expanded
echo "[run_flutter_from_root] Completed successfully."
