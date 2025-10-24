#!/usr/bin/env bash
set -euo pipefail

# CI entry to ensure Flutter runs inside the mobile app directory.

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
APP_DIR="${REPO_ROOT}/fleet-management-system-179272-179281/fleetease_android_app"

echo "[.ci/scripts/run_mobile] REPO_ROOT=${REPO_ROOT}"
echo "[.ci/scripts/run_mobile] APP_DIR=${APP_DIR}"

if [ ! -d "${APP_DIR}" ]; then
  echo "[.ci/scripts/run_mobile] ERROR: App directory not found: ${APP_DIR}" >&2
  exit 1
fi

cd "${APP_DIR}"
echo "[.ci/scripts/run_mobile] PWD=$(pwd)"
flutter pub get
flutter analyze
CI=true flutter test -r expanded
echo "[.ci/scripts/run_mobile] Success"
