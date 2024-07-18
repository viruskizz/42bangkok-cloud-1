#!/bin/bash

. "$HOME/tools/db-conf.sh"

. "$HOME/tools/wp-init.sh"

. "$HOME/tools/wp-redis.sh"

# Start php-fpm
DIR="/run/php"
if [ ! -d "$DIR" ]; then
  mkdir -p "$DIR"
fi
