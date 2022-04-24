#!/bin/sh

set -e

case "$1" in

  web)
    exec puma -C config/puma.rb
    ;;

  *)
    exec "$@"
    ;;

esac
