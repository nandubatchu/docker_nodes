#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for parity"

  set -- parity "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "parity" ]; then
  mkdir -p "$PARITY_DATA"
  chmod 700 "$PARITY_DATA"
  chown -R ethereum "$PARITY_DATA"

  echo "$0: setting data directory to $PARITY_DATA"

  set -- "$@" --base-path="$PARITY_DATA" --log-file="$PARITY_DATA/debug.log" --config="$PARITY_DATA/config.toml"
fi

echo
exec "$@"