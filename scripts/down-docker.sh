#!/bin/bash
FILE="/home/ubuntu/app/docker-compose.yml"

if [ -f "$FILE" ]; then
  docker compose -f $FILE down
fi