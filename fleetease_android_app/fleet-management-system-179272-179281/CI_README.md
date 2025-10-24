# FleetEase CI Guide

To avoid "Could not determine project root directory for Flutter project", ensure CI runs Flutter commands inside the Flutter app folder.

Recommended entrypoint from repository root:
bash fleet-management-system-179272-179281/ci.sh

Alternatively, execute the following steps in CI:
- cd fleet-management-system-179272-179281/fleetease_android_app
- flutter pub get
- flutter analyze
- CI=true flutter test -r expanded
