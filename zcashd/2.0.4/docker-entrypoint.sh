#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for zcashd"

  set -- zcashd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "zcashd" ]; then
  mkdir -p "$ZCASH_DATA"
  chmod 700 "$ZCASH_DATA"
  chown -R zcash "$ZCASH_DATA"

  echo "$0: setting data directory to $ZCASH_DATA"

  set -- "$@" -datadir="$ZCASH_DATA"
fi

echo
exec "$@"