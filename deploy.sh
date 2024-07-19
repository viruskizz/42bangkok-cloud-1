#!/bin/bash
COMMIT_ID=3b1b6a45d5a14142a8867da264b4157c6d77b1f3
REPOSITORY=viruskizz/42bangkok-cloud-1

DEPLOYMENT=$(aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1)

echo "DeploymentID: " $(jq '.deploymentId' "$DEPLOYMENT")