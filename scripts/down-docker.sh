#!/bin/bash
FILE="docker-compose.yml"

if [ -f "$FILE" ]; then
  docker compose down
fi