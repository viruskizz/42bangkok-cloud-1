#!/bin/bash
COMMIT_ID=1f5a4fea2a6aa84510f9122b201982bb6bceaa96
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

echo "DeploymentID:" $(echo "$DEPLOYMENT" | jq '.deploymentId')