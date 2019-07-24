#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for bitcoind"

  set -- bitcoind "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "bitcoind" ]; then
  mkdir -p "$BITCOIN_SV_DATA"
  chmod 700 "$BITCOIN_SV_DATA"
  chown -R bitcoinsv "$BITCOIN_SV_DATA"

  echo "$0: setting data directory to $BITCOIN_SV_DATA"

  set -- "$@" -datadir="$BITCOIN_SV_DATA"
fi

echo
exec "$@"