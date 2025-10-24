#!/usr/bin/env bash
set -euo pipefail

# Single entrypoint for CI systems. Ensures all Flutter commands run from the app directory.
# Usage (from repo root):
#   bash ci_entrypoint.sh analyze
#   bash ci_entrypoint.sh test
#   bash ci_entrypoint.sh "build apk --debug"
# If your CI runs 'flutter analyze' directly from repo root, replace it with:
#   bash ci_entrypoint.sh analyze

CMD="${1:-analyze}"

# Normalize args into an array
IFS=' ' read -r -a ARGS <<< "$CMD"

# Ensure scripts are executable
chmod +x flutterw.sh || true

# Delegate to wrapper which cd's into the app dir
./flutterw.sh "${ARGS[@]}"
