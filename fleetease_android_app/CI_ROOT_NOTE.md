# CI Root Note

If your CI runs Flutter from the repository root and you see:
> Error: Could not determine project root directory for Flutter project

Use the helper that passes an explicit project root:

- bash run_flutter_with_project_root.sh analyze
- bash run_flutter_with_project_root.sh test

This ensures Flutter uses the correct project path:
fleet-management-system-179272-179281/fleetease_android_app
