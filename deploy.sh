#!/bin/bash
COMMIT_ID=e3145bb7966b191443656a5f5a21bc8eca8ee968
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

echo "DeploymentID:" $(echo "$DEPLOYMENT" | jq '.deploymentId')