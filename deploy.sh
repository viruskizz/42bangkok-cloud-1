#!/bin/bash
COMMIT_ID=979603be80656b4738406372824eee75970fbf5b
REPOSITORY=viruskizz/42bangkok-cloud-1

aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name Cloud1-group \
  --github-location repository=$REPOSITORY,commitId=$COMMIT_ID \
  --region ap-southeast-1