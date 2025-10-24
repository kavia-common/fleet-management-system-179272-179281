# Workspace Structure and CI Entry

This repository contains a Flutter app inside:
- fleet-management-system-179272-179281/fleetease_android_app

CI MUST run Flutter commands from that directory. Use one of these entry scripts from repo root:
- bash fleet-management-system-179272-179281/ci.sh
- bash fleet-management-system-179272-179281/run_ci_from_root.sh
- bash fleet-management-system-179272-179281/analyze.sh
- bash fleet-management-system-179272-179281/test.sh

Alternatively:
cd fleet-management-system-179272-179281/fleetease_android_app && flutter pub get && flutter analyze && CI=true flutter test -r expanded
