#!/usr/bin/env bash
set -euo pipefail

echo "FleetEase Mobile CI Instructions"
echo "This repository contains the Flutter app at:"
echo "  fleet-management-system-179272-179281/fleetease_android_app"
echo
echo "From repository root, run any ONE of the following:"
echo "  bash run_mobile_checks.sh"
echo "  ./flutterw analyze && CI=true ./flutterw test -r expanded"
echo "  bash ci_entry.sh analyze && CI=true bash ci_entry.sh test -r expanded"
echo "  bash universal_mobile_ci.sh"
echo "  bash analyze.sh && bash test.sh"
echo
echo "If your CI uses a single entry:"
echo "  bash run_mobile_checks.sh"
echo
echo "If you still see 'Could not determine project root directory for Flutter project',"
echo "it means Flutter ran outside the app directory. Ensure the working directory is switched to:"
echo "  fleet-management-system-179272-179281/fleetease_android_app"
exit 1
