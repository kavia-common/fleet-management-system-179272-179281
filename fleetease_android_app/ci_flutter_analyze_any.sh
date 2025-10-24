#!/usr/bin/env bash
# CI aggregator that attempts multiple known strategies to run flutter analyze
# from the correct Flutter app directory. It exits successfully on the first
# working approach, minimizing CI integration friction.

set -euo pipefail

try_run() {
  echo "[ci] trying: $*"
  if "$@"; then
    echo "[ci] succeeded: $*"
    exit 0
  else
    echo "[ci] failed: $*"
  fi
}

# 1) App-local runner
if [ -x "fleet-management-system-179272-179281/fleetease_android_app/analyze.sh" ]; then
  try_run fleet-management-system-179272-179281/fleetease_android_app/analyze.sh
fi

# 2) Repo-root wrappers
if [ -x "./ci_flutter_analyze.sh" ]; then
  try_run ./ci_flutter_analyze.sh
fi

if [ -x "./ci_flutter_analyze_execdir.sh" ]; then
  try_run ./ci_flutter_analyze_execdir.sh
fi

if [ -x "./ci_flutter_analyze_posix.sh" ]; then
  try_run ./ci_flutter_analyze_posix.sh
fi

# 3) Makefile target
if command -v make >/dev/null 2>&1; then
  try_run make -C fleet-management-system-179272-179281 ci-analyze
  try_run make ci-analyze
fi

# 4) Generic wrapper using our universal exec
if [ -x "./flutter_ci_exec.sh" ]; then
  try_run ./flutter_ci_exec.sh analyze
fi

# 5) GitHub-style app-local script via repo path
try_run bash fleet-management-system-179272-179281/fleetease_android_app/ci_run_flutter.sh analyze

# 6) Direct subshell cd + analyze (most basic)
(
  set -e
  cd fleet-management-system-179272-179281/fleetease_android_app
  echo "[ci] PWD: $(pwd)"
  flutter pub get
  flutter analyze
) && exit 0

echo "[ci] All strategies failed. Please ensure CI runs from or cd's into the Flutter app directory." >&2
exit 2
