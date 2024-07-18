#!/bin/bash
aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name cloud1-group \
  --github-location repository=viruskizz/42bangkok-cloud-1,commitId=1e442f7c16f5f0cc5a6a70796679ec7e9506fb31 \
  --region ap-southeast-1