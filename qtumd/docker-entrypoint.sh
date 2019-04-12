#!/bin/sh
set -e

if [ $(echo "$1" | cut -c1) = "-" ]; then
  echo "$0: assuming arguments for qtumd"

  set -- qtumd "$@"
fi

if [ $(echo "$1" | cut -c1) = "-" ] || [ "$1" = "qtumd" ]; then
  mkdir -p "$QTUM_DATA"
  chmod 700 "$QTUM_DATA"
  chown -R qtum "$QTUM_DATA"

  echo "$0: setting data directory to $QTUM_DATA"

  set -- "$@" -datadir="$QTUM_DATA"
fi

echo
exec "$@"