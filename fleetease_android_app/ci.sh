#!/usr/bin/env bash
set -euo pipefail

# Delegate to workspace CI scripts which enter the Flutter app directory.
bash fleet-management-system-179272-179281/analyze.sh
bash fleet-management-system-179272-179281/test.sh
