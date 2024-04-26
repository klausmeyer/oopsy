#!/bin/sh

set -e

case "$1" in

  web)
    bundle exec rails db:prepare

    exec bundle exec puma -C config/puma.rb
    ;;

  sidekiq)
    bundle exec rails db:prepare

    shift
    exec bundle exec sidekiq $@
    ;;

  *)
    exec "$@"
    ;;

esac
