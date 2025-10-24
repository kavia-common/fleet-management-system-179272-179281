#!/usr/bin/env bash
set -euo pipefail

candidates=(
  "fleet-management-system-179272-179281/fleetease_android_app"
  "fleetease_android_app"
  "."
)

for dir in "${candidates[@]}"; do
  if [ -f "$dir/pubspec.yaml" ] && grep -q "^flutter:" "$dir/pubspec.yaml"; then
    echo "[detector] Found Flutter project at: $dir"
    echo "[detector] To analyze: cd $dir && flutter pub get && flutter analyze"
    echo "[detector] To test:    cd $dir && CI=true flutter test -r expanded"
    exit 0
  fi
done

echo "[detector] ERROR: Could not find a Flutter project. Checked:"
printf ' - %s\n' "${candidates[@]}"
exit 3
