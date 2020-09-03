#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for digibyted"

  set -- digibyted "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "digibyted" ]; then
  mkdir -p "$DIGIBYTE_DATA"
  chmod 700 "$DIGIBYTE_DATA"
  chown -R digibyte "$DIGIBYTE_DATA"

  echo "$0: setting data directory to $DIGIBYTE_DATA"

  set -- "$@" -datadir="$DIGIBYTE_DATA"
fi

echo
exec "$@"