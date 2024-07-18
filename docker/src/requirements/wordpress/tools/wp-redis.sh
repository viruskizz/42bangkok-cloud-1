#!/bin/bash
REDIS_HOST=$(wp config get WP_REDIS_HOST --allow-root)
if [ -z $REDIS_HOST ]; then

wp config set WP_REDIS_HOST "redis" --allow-root
wp config set WP_REDIS_PORT "6379" --allow-root
wp config set WP_REDIS_TIMEOUT "1" --allow-root
wp config set WP_REDIS_READ_TIMEOUT "1" --allow-root
wp config set WP_REDIS_DATABASE "0" --allow-root
# Install redis plugin
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

fi
