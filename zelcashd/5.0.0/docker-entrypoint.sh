#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for zelcashd"

  set -- zelcashd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "zelcashd" ]; then
  mkdir -p "$ZELCASH_DATA"
  chmod 700 "$ZELCASH_DATA"
  chown -R zelcash "$ZELCASH_DATA"

  echo "$0: setting data directory to $ZELCASH_DATA"

  set -- "$@" -datadir="$ZELCASH_DATA"
fi

echo
exec "$@"