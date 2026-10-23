#!/bin/bash
set -eu

APP_NAME="ghost"
INSTALL_ROOT="$HOME/.ghostspectrum"
CONFIG_DIR="$INSTALL_ROOT/config"
THEME_DIR="$INSTALL_ROOT/themes"
LOG_DIR="$INSTALL_ROOT/logs"

mkdir -p "$CONFIG_DIR" "$THEME_DIR" "$LOG_DIR"

cat > "$CONFIG_DIR/ghostspectrum.json" <<EOF
{
  "appName": "GhostSpectrum",
  "theme": "default",
  "terminalPath": "~/",
  "modules": [
    "usb-hid",
    "android-tools",
    "heimdall",
    "adb-fastboot"
  ]
}
EOF

if ! command -v "$APP_NAME" >/dev/null 2>&1; then
  echo "alias $APP_NAME='cd ~/ && npm start -- --nointro'" >> "$HOME/.bashrc"
  echo "GhostSpectrum alias added to ~/.bashrc"
fi

echo "GhostSpectrum bootstrap complete. Files created under $INSTALL_ROOT"
