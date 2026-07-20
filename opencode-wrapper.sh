#!/usr/bin/env bash
set -Eeuo pipefail

bridge_dir="${OPENCODE_PUTER_BRIDGE_DIR:-$HOME/.local/share/opencode-puter-bridge}"
real_opencode="${OPENCODE_REAL_BIN:-$HOME/.opencode/bin/opencode}"

if [[ "${1:-}" == "-n" ]]; then
    shift
    exec "$real_opencode" "$@"
fi

export OPENCODE_BIN="$real_opencode"
exec "$bridge_dir/run_opencode_puter.sh" "$@"
