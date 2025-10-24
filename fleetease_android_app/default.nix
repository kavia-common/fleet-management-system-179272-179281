{ pkgs ? import <nixpkgs> {} }:

let
  flutter = pkgs.flutter;
in pkgs.mkShell {
  name = "fleetease-shell";
  buildInputs = [ flutter pkgs.git pkgs.bash ];
  shellHook = ''
    export FLEETEASE_APP_DIR="fleet-management-system-179272-179281/fleetease_android_app"
    echo "[nix-shell] Use these commands:"
    echo "  cd $FLEETEASE_APP_DIR && flutter pub get && flutter analyze"
    echo "  cd $FLEETEASE_APP_DIR && CI=true flutter test"
  '';
}
