#!/bin/bash
COMMIT_ID=dea4b36613defdcf909a6dc5123b801b7102e6e1
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

export DEPLOYMENT_ID=$(echo "$DEPLOYMENT" | jq -r '.deploymentId')