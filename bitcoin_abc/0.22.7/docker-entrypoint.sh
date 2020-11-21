#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for bitcoind"

  set -- bitcoind "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "bitcoind" ]; then
  mkdir -p "$BITCOIN_ABC_DATA"
  chmod 700 "$BITCOIN_ABC_DATA"
  chown -R bitcoinabc "$BITCOIN_ABC_DATA"

  echo "$0: setting data directory to $BITCOIN_ABC_DATA"

  set -- "$@" -datadir="$BITCOIN_ABC_DATA"
fi

echo
exec "$@"