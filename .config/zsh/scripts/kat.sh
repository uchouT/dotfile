#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

if (( $# != 1 )); then
  printf 'usage: kat FILE\n' >&2
  exit 2
fi

path=$1
mimetype=$(file --mime-type --brief -- "$path")

if [[ $mimetype == image/* ]] && command -v kitten >/dev/null 2>&1; then
  printf '\n'
  command kitten icat -- "$path"
else
  command cat -- "$path"
fi
