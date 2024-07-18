#!/bin/bash
COMMIT_ID=f9530e642d720af730fbc4be090007c85cc87b73

aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name cloud1-group \
  --github-location repository=viruskizz/42bangkok-cloud-1,commitId=$COMMIT_ID \
  --region ap-southeast-1