#!/bin/bash
FILE="/home/ubuntu/app/docker-compose.yml"
docker compose -f $FILE up --detach --build