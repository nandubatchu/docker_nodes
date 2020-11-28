#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for dashd"

  set -- dashd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "dashd" ]; then
  mkdir -p "$DASHCORE_DATA"
  chmod 700 "$DASHCORE_DATA"
  chown -R dashcore "$DASHCORE_DATA"

  echo "$0: setting data directory to $DASHCORE_DATA"

  set -- "$@" -datadir="$DASHCORE_DATA"
fi

echo
exec "$@"