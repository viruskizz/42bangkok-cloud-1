#!/bin/bash
COMMIT_ID=531d46a2739f021956b02ba08e8e1f019b754e08
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

echo "DeploymentID:" $(echo "$DEPLOYMENT" | jq '.deploymentId')