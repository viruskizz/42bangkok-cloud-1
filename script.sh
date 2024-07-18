#!/bin/bash
aws deploy create-deployment \
    --application-name Cloud1-codedeploy-app \
    --deployment-group-name cloud1-group \
    --github-location repository=viruskizz/42bangkok-cloud-1,commitId=4dfd2653148c3519161ad67f9fd36dd7d0ad8383