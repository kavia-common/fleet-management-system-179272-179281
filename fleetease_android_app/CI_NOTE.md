Run Flutter commands from this directory for CI:

flutter pub get
flutter analyze
CI=true flutter test

Alternatively from repo root:

bash ci.sh
# or
make analyze
make test
