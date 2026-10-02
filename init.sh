#!/usr/bin/env bash
set -euo pipefail

usage() {
  printf 'Usage: %s <project-directory>\n' "$0"
}

if [[ $# -eq 1 && ( "$1" == '-h' || "$1" == '--help' ) ]]; then
  usage
  exit 0
fi

if [[ $# -ne 1 || -z "$1" ]]; then
  usage >&2
  exit 2
fi

# Check prerequisites before creating or copying project files.
if ! command -v wrk >/dev/null 2>&1; then
  printf 'Missing required tool: wrk. Install it and add it to PATH:\n  https://github.com/calebmchenry/wrk#build-and-install\n' >&2
  exit 1
fi

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
case "$1" in
  /*) destination="$1" ;;
  *) destination="$PWD/$1" ;;
esac

if [[ -e "$destination" || -L "$destination" ]]; then
  if [[ ! -d "$destination" || -L "$destination" ]]; then
    printf 'Destination must be a new or empty directory: %s\n' "$destination" >&2
    exit 1
  fi

  shopt -s nullglob dotglob
  entries=("$destination"/*)
  if [[ ${#entries[@]} -ne 0 ]]; then
    printf 'Destination is not empty: %s\n' "$destination" >&2
    exit 1
  fi
fi

mkdir -p -- "$destination"
cp -R "$script_dir/template/." "$destination/"
(
  cd -- "$destination"
  wrk init
  wrk validate
)

printf '\nProject initialized at %s\nStart with README.md and docs/wiki/index.md.\n' "$destination"
