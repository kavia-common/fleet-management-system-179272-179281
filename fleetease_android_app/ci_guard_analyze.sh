#!/usr/bin/env bash
set -euo pipefail

APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"

echo "[ci_guard] PWD: $(pwd)"
echo "[ci_guard] Which flutter:"
command -v flutter || { echo "[ci_guard] ERROR: flutter not found in PATH"; exit 127; }

echo "[ci_guard] Flutter version:"
flutter --version || true

if [ ! -d "${APP_DIR}" ]; then
  echo "[ci_guard] ERROR: App dir missing: ${APP_DIR}"
  ls -la || true
  exit 2
fi

if [ ! -f "${APP_DIR}/pubspec.yaml" ]; then
  echo "[ci_guard] ERROR: pubspec.yaml not found in ${APP_DIR}"
  ls -la "${APP_DIR}" || true
  exit 2
fi

echo "[ci_guard] Changing directory to ${APP_DIR}"
cd "${APP_DIR}"

echo "[ci_guard] Running flutter pub get"
flutter pub get

echo "[ci_guard] Running flutter analyze"
flutter analyze
