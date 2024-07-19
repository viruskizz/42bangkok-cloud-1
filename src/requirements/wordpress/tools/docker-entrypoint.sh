#!/bin/bash

echo "db-conf.sh"

. "$HOME/tools/db-conf.sh"

echo "wp-init.sh"

. "$HOME/tools/wp-init.sh"

# Start php-fpm
DIR="/run/php"
if [ ! -d "$DIR" ]; then
  mkdir -p "$DIR"
fi
