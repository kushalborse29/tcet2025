#!/usr/bin/env bash
# =============================================================================
#  Compatibility wrapper.
#  The real installer is setup_dvwa.sh - this file only exists so that
#      bash setup-dvwa.sh
#  also works. You can run it with or without sudo.
# =============================================================================
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$(id -u)" -eq 0 ]; then
    exec bash "$HERE/setup_dvwa.sh" "$@"
else
    exec sudo bash "$HERE/setup_dvwa.sh" "$@"
fi
