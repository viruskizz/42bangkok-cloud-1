#!/bin/bash
COMMIT_ID=56fcf6d1de64be7f84448dead47b5a6036e0e49a
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

export DEPLOYMENT_ID=$(echo "$DEPLOYMENT" | jq -r '.deploymentId')