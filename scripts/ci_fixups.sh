#!/usr/bin/env bash
set -euo pipefail

# Replace the fancy unicode arrow (U+2192) with ASCII '->' in all docs
# It sometimes sneaks in from copy/paste and confuses the C++ lexer.
if [ -d docs ]; then
  mapfile -t files < <(grep -rl $'\xE2\x86\x92' docs || true)
  if [ "${#files[@]}" -gt 0 ]; then
    sed -i 's/→/->/g' "${files[@]}"
    echo "[fixups] Replaced unicode arrows in ${#files[@]} files"
  fi
fi
