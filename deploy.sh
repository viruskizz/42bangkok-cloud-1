#!/bin/bash
COMMIT_ID=0421f2cb810cb6a86f3d7b4fec38d2a657baec2c
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

export DEPLOYMENT_ID=$(echo "$DEPLOYMENT" | jq -r '.deploymentId')