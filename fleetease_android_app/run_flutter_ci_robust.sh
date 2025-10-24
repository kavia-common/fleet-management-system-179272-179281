#!/usr/bin/env bash
set -euo pipefail

echo "[robust_ci] Starting Flutter CI runner"

# Optional: allow CI to pass a custom Flutter SDK path via FLUTTER_HOME
if [ -n "${FLUTTER_HOME:-}" ] && [ -d "${FLUTTER_HOME}" ]; then
  export PATH="${FLUTTER_HOME}/bin:${PATH}"
  echo "[robust_ci] Using FLUTTER_HOME=${FLUTTER_HOME}"
fi

# Validate flutter availability
if ! command -v flutter >/dev/null 2>&1; then
  echo "[robust_ci] ERROR: 'flutter' not found on PATH." >&2
  echo "[robust_ci] Ensure CI installs Flutter SDK (e.g., actions/setup or system package) and exports PATH." >&2
  exit 100
fi

# Resolve absolute repository root and app dir
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
APP_DIR="${REPO_ROOT}/fleet-management-system-179272-179281/fleetease_android_app"

echo "[robust_ci] REPO_ROOT=${REPO_ROOT}"
echo "[robust_ci] APP_DIR=${APP_DIR}"

if [ ! -d "${APP_DIR}" ]; then
  echo "[robust_ci] ERROR: App directory not found: ${APP_DIR}" >&2
  exit 101
fi

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[robust_ci] ERROR: pubspec.yaml not found in ${APP_DIR}" >&2
  exit 102
fi

# Change to app directory using absolute path
cd "${APP_DIR}"
echo "[robust_ci] PWD=$(pwd)"

# Run
echo "[robust_ci] flutter --version"
flutter --version || true

echo "[robust_ci] flutter pub get"
flutter pub get

echo "[robust_ci] flutter analyze"
flutter analyze

echo "[robust_ci] CI=true flutter test -r expanded"
CI=true flutter test -r expanded

echo "[robust_ci] Completed successfully."
