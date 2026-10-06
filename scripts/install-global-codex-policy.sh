#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET="${HOME}/.codex/AGENTS.md"

mkdir -p "${HOME}/.codex"
rm -f "$TARGET"
ln -s "$SOURCE_DIR/AGENTS.md" "$TARGET"
printf 'Global Codex policy linked: %s -> %s\n' "$TARGET" "$SOURCE_DIR/AGENTS.md"
