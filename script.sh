#!/bin/bash
aws deploy create-deployment \
    --application-name Cloud1-codedeploy-app \
    --deployment-group-name cloud1-group \
    --github-location repository=viruskizz/42bangkok-cloud-1,commitId=7d714da5a6d658cf0294101b0fb66543654a3cbc \
    --region ap-southeast-1