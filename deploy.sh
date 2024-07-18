#!/bin/bash
COMMIT_ID=d3a8a2aed0fe01c2283976df61a0d2836c05c05a
REPOSITORY=viruskizz/42bangkok-cloud-1

aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1