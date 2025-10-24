# CI How-To

To avoid "Could not determine project root directory for Flutter project", never call `flutter` from the repository root.

From repo root, use:
- bash .ci_run.sh
- or make ci-analyze
- or bash ci_guard_analyze.sh

All of these change into fleet-management-system-179272-179281/fleetease_android_app before running Flutter commands.
