#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for dcrd"

  set -- dcrd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "dcrd" ]; then
  mkdir -p "$DECRED_DATA"
  chmod 700 "$DECRED_DATA"

  echo "$0: setting data directory to $DECRED_DATA"

  set -- "$@" --datadir="$DECRED_DATA"
fi

echo
exec "$@"