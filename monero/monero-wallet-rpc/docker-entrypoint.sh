#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for monero-wallet-rpc"

  set -- monero-wallet-rpc "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "monero-wallet-rpc" ]; then
  mkdir -p "$MONERO_DATA"
  chmod 700 "$MONERO_DATA"
  chown -R monero "$MONERO_DATA"

  echo "$0: setting data directory to $MONERO_DATA"

  set -- "$@" --config-file="$MONERO_DATA/monero-wallet-cli.conf" --wallet-dir="$MONERO_DATA/wallet-dir" --log-file="$MONERO_DATA/debug.log"
fi

echo
exec "$@"