#!/usr/bin/env bash
set -euo pipefail

_on_error() {
  trap '' ERR
  line_path=$(caller)
  line=${line_path% *}
  path=${line_path#* }

  echo ""
  echo "ERR $path:$line $BASH_COMMAND exited with $1"
}
trap '_on_error $?' ERR

[ "this" = "works" ] && uptime

_wat() {
  [ "this" = "doesnt" ] && uptime
}

_wat