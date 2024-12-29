#!/bin/bash
COMMIT_ID=8d3d8867c2d38354057278302f33578316841448
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

export DEPLOYMENT_ID=$(echo "$DEPLOYMENT" | jq -r '.deploymentId')