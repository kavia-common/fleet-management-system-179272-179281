@echo off
REM Windows CI helper to run flutter analyze from the correct app directory.
setlocal ENABLEDELAYEDEXPANSION

set ROOT_DIR=%~dp0
set APP_DIR=%ROOT_DIR%fleet-management-system-179272-179281\fleetease_android_app

IF NOT EXIST "%APP_DIR%\pubspec.yaml" (
  echo [ci] ERROR: pubspec.yaml not found in %APP_DIR%
  exit /b 2
)

pushd "%APP_DIR%"
echo [ci] PWD: %CD%
flutter pub get
flutter analyze
popd
endlocal
