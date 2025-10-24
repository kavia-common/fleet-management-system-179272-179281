# FleetEase App Developer Notes

Run Flutter commands from this directory (Flutter project root):

Analyze:
  flutter pub get
  flutter analyze

Test:
  CI=true flutter test -r expanded

Data source:
- Default is LocalSqliteDataSource (persistent). Switch with .env:
  DATA_SOURCE=memory  # in-memory
  DATA_SOURCE=sqlite  # sqlite (default)
