#!/bin/bash
COMMIT_ID=0223ccf55f208eea5118607c46a0518f988e8b48
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

export DEPLOYMENT_ID=$(echo "$DEPLOYMENT" | jq -r '.deploymentId')