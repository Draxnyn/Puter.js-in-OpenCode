#!/usr/bin/env bash
set -Eeuo pipefail

bridge_dir="${OPENCODE_PUTER_BRIDGE_DIR:-$HOME/.local/share/opencode-puter-bridge}"
if [[ -f "$bridge_dir/bridge-settings.sh" ]]; then
    source "$bridge_dir/bridge-settings.sh"
fi
real_opencode="${OPENCODE_REAL_BIN:-$HOME/.opencode/bin/opencode}"

if [[ "${1:-}" == "-n" ]]; then
    shift
    # Recent OpenCode builds show the CLI help for an empty invocation. Passing
    # the current directory explicitly starts the normal TUI.
    if (( $# == 0 )); then
        exec "$real_opencode" .
    fi
    exec "$real_opencode" "$@"
fi

export OPENCODE_BIN="$real_opencode"
exec "$bridge_dir/run_opencode_puter.sh" "$@"
