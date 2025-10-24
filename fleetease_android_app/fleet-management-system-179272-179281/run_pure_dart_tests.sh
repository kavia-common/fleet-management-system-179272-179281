#!/usr/bin/env bash
set -euo pipefail

# Run pure-Dart tests that do not require Flutter project root/tooling.
cd "fleet-management-system-179272-179281/fleetease_android_app"

if ! command -v dart >/dev/null 2>&1; then
  echo "Dart SDK is required to run pure-Dart tests."
  exit 1
fi

# Ensure package config exists for analysis; attempt a best-effort fetch if Flutter is present.
if command -v flutter >/dev/null 2>&1; then
  flutter pub get >/dev/null 2>&1 || true
fi

# Execute tests in the test_core directory using Dart.
for t in test_core/*.dart; do
  echo "Running pure-Dart test: $t"
  dart test "$t" || {
    echo "Falling back to 'dart run $t' if 'dart test' is not configured."
    dart run "$t"
  }
done
