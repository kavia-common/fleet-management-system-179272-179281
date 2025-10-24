# FleetEase App CI

Always run Flutter from this directory (Flutter project root).

One-liner:
  flutter pub get && flutter analyze && CI=true flutter test -r expanded

If CI runs from repository root, use any of these:
  ./flutterw analyze && CI=true ./flutterw test -r expanded
  bash run_mobile_checks.sh
  bash ci_entry.sh analyze && CI=true bash ci_entry.sh test -r expanded
  bash universal_mobile_ci.sh
