#!/bin/bash
aws deploy create-deployment \
  --application-name Cloud1-codedeploy-app \
  --deployment-group-name cloud1-group \
  --github-location repository=viruskizz/42bangkok-cloud-1,commitId=a49a8dec0207041b9c89cf97e34d3ed963db2eb1 \
  --region ap-southeast-1