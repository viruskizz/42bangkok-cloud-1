#!/bin/bash
COMMIT_ID=3b3269f0de29b4b035154b187526337b55d36d77
REPOSITORY=viruskizz/42bangkok-cloud-1

aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1