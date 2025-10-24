# Root-level Flutter Stub

This repository's actual Flutter app is located at:
- fleet-management-system-179272-179281/fleetease_android_app

The files under ./android/ and ./lib/ are a minimal stub so CI systems that insist on a Flutter project at repository root can pass project detection. Do NOT build or release from this stub.

For development and CI:
- cd fleet-management-system-179272-179281/fleetease_android_app
- flutter pub get
- flutter analyze
- CI=true flutter test -r expanded
