#!/usr/bin/env bash

set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PROFILE_DIR="$ROOT_DIR/environments/python"

if [ ! -d "$PROFILE_DIR" ]; then
  echo "Error: Python environment profile not found: $PROFILE_DIR" >&2
  exit 1
fi

copy_if_missing() {
  local source="$1"
  local target="$2"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "✓ Keeping existing $target"
    return
  fi

  mkdir -p "$(dirname "$target")"
  cp "$source" "$target"
  echo "✓ Copied $target"
}

copy_if_missing "$PROFILE_DIR/.gitignore" "$ROOT_DIR/.gitignore"
copy_if_missing "$PROFILE_DIR/.python-version" "$ROOT_DIR/.python-version"
copy_if_missing "$PROFILE_DIR/requirements.txt" "$ROOT_DIR/requirements.txt"
copy_if_missing "$PROFILE_DIR/.vscode/launch.json" "$ROOT_DIR/.vscode/launch.json"

PYTHON_BIN="${PYTHON_BIN:-python3}"
VENV_DIR="$ROOT_DIR/.venv"

if [ ! -x "$VENV_DIR/bin/python" ]; then
  echo "Creating Python virtual environment in .venv"
  "$PYTHON_BIN" -m venv "$VENV_DIR"
fi

"$VENV_DIR/bin/python" -m pip install --upgrade pip
"$VENV_DIR/bin/python" -m pip install -r "$ROOT_DIR/requirements.txt"

echo ""
echo "Python setup complete."
echo "Activate it with: source .venv/bin/activate"
